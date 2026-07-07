import BottomSheet, { BottomSheetView } from '@gorhom/bottom-sheet'
import polyline from '@mapbox/polyline'
import { GeoJSONSource, Layer, ViewAnnotation, ViewStateChangeEvent } from '@maplibre/maplibre-react-native'
import { IMessage } from '@stomp/stompjs'
import { useQueryClient } from '@tanstack/react-query'
import { useNavigation } from 'expo-router'
import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Dimensions, NativeSyntheticEvent, Pressable, StyleSheet, View } from 'react-native'
import { useSafeAreaInsets } from 'react-native-safe-area-context'

import { ContainerInfo } from '@/components/map-screen/container-info'
import { ReportsContainer } from '@/components/map-screen/reports-container'
import { Submit } from '@/components/map-screen/submit'
import { MapView } from '@/components/register/map-view'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { MarkerContainer } from '@/components/ui/marker-container'
import { DEFAULT_LOCATION } from '@/constants/location'
import { useDriverTripContext } from '@/context/driver-trip-context'
import { useStompContext } from '@/context/stomp-context'
import { useContainerInViewport } from '@/hooks/use-container'
import { useDriverRoute } from '@/hooks/use-route'
import { useTheme } from '@/hooks/use-theme'
import { IBound } from '@/types/bound'
import { IContainerMetric } from '@/types/container'
import loggers from '@/utils/loggers'

const log = loggers.exploreDriver

const { height } = Dimensions.get('window')

export const ExploreContentDriver = () => {
  const insets = useSafeAreaInsets()

  const [location, setLocation] = useState({
    longitude: DEFAULT_LOCATION.longitude,
    latitude: DEFAULT_LOCATION.latitude,
  })
  // const [hasRealLocation, setHasRealLocation] = useState(false)
  const [bounds, setBounds] = useState<IBound | null>(null)
  const [containerSelectedId, setContainerSelectedId] = useState<number | null>(null)
  const [liveMetric, setLiveMetric] = useState<IContainerMetric | null>(null)
  const [visibility, setVisibility] = useState(false)

  const theme = useTheme()
  const { data: containers } = useContainerInViewport(bounds)
  const bottomSheetRef = useRef<BottomSheet>(null)
  const navigation = useNavigation()
  const { connected, subscribe, publish } = useStompContext()
  const { data: myRoutes } = useDriverRoute()
  const queryClient = useQueryClient()
  const { currentPosition } = useDriverTripContext()

  const mapHeight = height - insets.top - insets.bottom - 32 - 68

  // useEffect(() => {
  //   log.debug('currentPosition:', currentPosition)
  // }, [currentPosition])

  // useEffect(() => {
  //   const localLocation = async () => {
  //     const location = await getCurrentLocation()
  //     if (!location) return
  //     setLocation({
  //       longitude: location.coords.longitude,
  //       latitude: location.coords.latitude,
  //     })
  //     setHasRealLocation(true)
  //   }

  //   localLocation()
  // }, [])

  useEffect(() => {
    if (!connected) return
    const metricSub = subscribe('/user/queue/metrics', (message: IMessage) => {
      const newContainerMetric = JSON.parse(message.body) as IContainerMetric
      setLiveMetric(newContainerMetric)
    })

    return () => {
      metricSub?.unsubscribe()
    }
  }, [connected, queryClient])

  useEffect(() => {
    if (!connected || !bounds) return
    publish('/app/viewport.update', bounds)
  }, [bounds, connected])

  const handleMapMove = (e: NativeSyntheticEvent<ViewStateChangeEvent>) => {
    const { bounds } = e.nativeEvent
    setBounds({
      north: bounds[3],
      south: bounds[1],
      east: bounds[2],
      west: bounds[0],
    })
  }

  const handleContainerTap = (containerId: number) => {
    bottomSheetRef.current?.snapToIndex(0)
    setContainerSelectedId(containerId)
  }

  const handleSheetChanges = useCallback(
    (index: number) => {
      const isOpen = index !== -1
      navigation.setOptions({
        tabBarStyle: {
          backgroundColor: theme.backgroundElement,
          elevation: 0,
          shadowOpacity: 0,
          borderTopWidth: 1,
          borderTopColor: theme.borderTabColor,
          display: isOpen ? 'none' : 'flex',
        },
      })
    },
    [navigation],
  )

  const updatedContainers = useMemo(() => {
    if (!containers) return []
    return containers?.map(c => (c.id === liveMetric?.container_id ? { ...c, last_metric: liveMetric } : c))
  }, [containers, liveMetric])

  const selectedContainer = useMemo(() => {
    if (!containerSelectedId || !updatedContainers) return null
    return updatedContainers.find(c => c.id === containerSelectedId)
  }, [containerSelectedId, updatedContainers])

  const handleOverlayPress = () => {
    setVisibility(prev => !prev)
  }

  const completeRoute = myRoutes?.polylines?.flatMap(p => polyline.decode(p.polyline)).map(([lat, lng]) => [lng, lat])
  const route = {
    type: 'FeatureCollection',
    features: [
      {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: completeRoute ?? [],
        },
      },
    ],
  } as const satisfies GeoJSON.GeoJSON

  return (
    <ThemedView type="backgroundElement" style={styles.container}>
      <ThemedView style={[styles.mapContainer, { height: mapHeight }]}>
        <MapView center={[location.longitude, location.latitude]} shouldCenter={false} onBoundsChange={handleMapMove}>
          {currentPosition && (
            <ViewAnnotation lngLat={[currentPosition.longitude, currentPosition.latitude]}>
              <View style={styles.myLocationMarker} />
            </ViewAnnotation>
          )}
          {updatedContainers?.map(({ id, latitude, longitude, last_metric }) => (
            <MarkerContainer
              key={id}
              longitude={longitude}
              latitude={latitude}
              fillingLevel={last_metric?.filling_level ?? 0}
              containerId={id}
              onTap={handleContainerTap}
              tooltipVisible={true}
              iconVisible={true}
            />
          ))}
          {completeRoute && (
            <GeoJSONSource id="routeSource" data={route}>
              <Layer
                id="routeLine"
                type="line"
                paint={{ 'line-color': 'red', 'line-width': 3 }}
                layout={{ visibility: visibility ? 'visible' : 'none' }}
              />
            </GeoJSONSource>
          )}
        </MapView>
        <Pressable
          onPress={handleOverlayPress}
          style={[styles.overlayContainer, { backgroundColor: theme.background, borderColor: theme.borderTabColor }]}
        >
          <ThemedText>Mi ruta</ThemedText>
        </Pressable>
      </ThemedView>

      <BottomSheet
        ref={bottomSheetRef}
        snapPoints={['70%']}
        enablePanDownToClose
        index={-1}
        onChange={handleSheetChanges}
        backgroundStyle={{ backgroundColor: theme.backgroundElement }}
        handleStyle={{ backgroundColor: theme.backgroundElement }}
        handleIndicatorStyle={{ backgroundColor: theme.text }}
        enableDynamicSizing={false}
        keyboardBehavior="interactive"
        keyboardBlurBehavior="restore"
      >
        <BottomSheetView style={styles.mainBottomSheetContainer}>
          {selectedContainer && <ContainerInfo container={selectedContainer} />}
          <ReportsContainer containerId={containerSelectedId!} />
          <Submit containerId={containerSelectedId!} />
        </BottomSheetView>
      </BottomSheet>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
  },
  mapContainer: {
    borderRadius: 16,
    overflow: 'hidden',
  },
  overlayContainer: {
    position: 'absolute',
    top: 16,
    left: 16,
    padding: 6,
    borderRadius: 8,
    borderWidth: 1,
  },
  myLocationMarker: {
    width: 16,
    height: 16,
    borderRadius: '100%',
    backgroundColor: '#2e7d32',
  },
  mainBottomSheetContainer: {
    height: '100%',
    justifyContent: 'space-between',
  },
})

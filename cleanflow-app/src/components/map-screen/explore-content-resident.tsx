import { ContainerInfo } from '@/components/map-screen/container-info'
import { ReportsContainer } from '@/components/map-screen/reports-container'
import { Submit } from '@/components/map-screen/submit'
import { MapView } from '@/components/register/map-view'
import { ThemedView } from '@/components/themed-view'
import { MarkerContainer } from '@/components/ui/marker-container'
import { MarkerDriver } from '@/components/ui/marker-driver'
import { DEFAULT_LOCATION } from '@/constants/location'
import { useAuthContext } from '@/context/auth-context'
import { useStompContext } from '@/context/stomp-context'
import { useContainerInViewport } from '@/hooks/use-container'
import { useResident } from '@/hooks/use-resident'
import { useTheme } from '@/hooks/use-theme'
import { getCurrentLocation } from '@/services/location'
import { IBound } from '@/types/bound'
import { IContainerMetric } from '@/types/container'
import { IDriverPosition } from '@/types/driver'
import { Entypo, Ionicons } from '@expo/vector-icons'
import BottomSheet, { BottomSheetView } from '@gorhom/bottom-sheet'
import { ViewStateChangeEvent } from '@maplibre/maplibre-react-native'
import { IMessage } from '@stomp/stompjs'
import { useQueryClient } from '@tanstack/react-query'
import { useNavigation } from 'expo-router'
import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Dimensions, NativeSyntheticEvent, Pressable, StyleSheet } from 'react-native'
import { useSafeAreaInsets } from 'react-native-safe-area-context'
import { MarkerHome } from '../ui/marker-home'
import { MarkerMyPosition } from '../ui/marker-my-position'

const { height } = Dimensions.get('window')

export const ExploreContentResident = () => {
  const insets = useSafeAreaInsets()

  const [location, setLocation] = useState({
    longitude: DEFAULT_LOCATION.longitude,
    latitude: DEFAULT_LOCATION.latitude,
  })
  const [hasRealLocation, setHasRealLocation] = useState(false)
  const [bounds, setBounds] = useState<IBound | null>(null)
  const [containerSelectedId, setContainerSelectedId] = useState<number | null>(null)
  const [liveMetric, setLiveMetric] = useState<IContainerMetric | null>(null)
  const [drivers, setDrivers] = useState<IDriverPosition[]>([])
  const [containerIconsVisible, setContainerIconsVisible] = useState(true)
  const [containerTooltipVisible, setContainerTooltipVisible] = useState(true)

  const theme = useTheme()
  const { data: containers } = useContainerInViewport(bounds)
  const bottomSheetRef = useRef<BottomSheet>(null)
  const navigation = useNavigation()
  const { connected, subscribe, publish } = useStompContext()
  const queryClient = useQueryClient()
  const { data: resident } = useResident()
  const { user } = useAuthContext()

  const mapHeight = height - insets.top - insets.bottom - 32 - 68

  useEffect(() => {
    const localLocation = async () => {
      const location = await getCurrentLocation()
      if (!location) return
      setLocation({
        longitude: location.coords.longitude,
        latitude: location.coords.latitude,
      })
      setHasRealLocation(true)
    }

    localLocation()
  }, [])

  useEffect(() => {
    if (!connected) return
    const driversSub = subscribe('/user/queue/drivers', (message: IMessage) => {
      const newDriver = JSON.parse(message.body) as IDriverPosition
      console.log('new driver', newDriver)
      setDrivers(prev => {
        const existingDriver = prev.find(d => d.driver_id === newDriver.driver_id)
        return existingDriver
          ? prev.map(d => (d.driver_id === newDriver.driver_id ? newDriver : d))
          : [...prev, newDriver]
      })
    })

    const metricSub = subscribe('/user/queue/metrics', (message: IMessage) => {
      const newContainerMetric = JSON.parse(message.body) as IContainerMetric
      setLiveMetric(newContainerMetric)
    })

    return () => {
      metricSub?.unsubscribe()
      driversSub?.unsubscribe()
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

  const handleContainerTap = useCallback((containerId: number) => {
    bottomSheetRef.current?.snapToIndex(0)
    setContainerSelectedId(containerId)
  }, [])

  const handleSheetChanges = useCallback(
    (index: number) => {
      const isOpen = index !== -1
      // bottomSheetRef.current?.snapToIndex(index)
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

  return (
    <ThemedView type="backgroundElement" style={styles.container}>
      <ThemedView style={[styles.mapContainer, { height: mapHeight }]}>
        <MapView
          center={[location.longitude, location.latitude]}
          shouldCenter={hasRealLocation}
          onBoundsChange={handleMapMove}
        >
          {/* TODO: render my position marker only if user is active the position service */}
          <MarkerMyPosition id={user?.id!} longitude={location.longitude} latitude={location.latitude} />
          {resident && <MarkerHome latitude={resident.latitude} longitude={resident.longitude} />}

          {updatedContainers?.map(({ id, latitude, longitude, last_metric }) => (
            <MarkerContainer
              key={id}
              longitude={longitude}
              latitude={latitude}
              fillingLevel={last_metric?.filling_level ?? 0}
              containerId={id}
              onTap={handleContainerTap}
              tooltipVisible={containerTooltipVisible}
              iconVisible={containerIconsVisible}
            />
          ))}

          {drivers?.map(({ driver_id, longitude, latitude }) => (
            <MarkerDriver key={driver_id} id={driver_id} longitude={longitude} latitude={latitude} />
          ))}
        </MapView>
        <ThemedView style={[styles.overlayContainer, { backgroundColor: theme.transparent }]}>
          <Pressable
            onPress={() => setContainerTooltipVisible(prev => !prev)}
            style={[styles.overlayButtom, { backgroundColor: theme.background }]}
          >
            <Entypo
              name="info-with-circle"
              size={18}
              color={containerTooltipVisible ? theme.overlayActive : theme.textSecondary}
            />
          </Pressable>
          <Pressable
            onPress={() => setContainerIconsVisible(prev => !prev)}
            style={[styles.overlayButtom, { backgroundColor: theme.background }]}
          >
            <Ionicons
              name="trash-sharp"
              size={18}
              color={containerIconsVisible ? theme.overlayActive : theme.textSecondary}
            />
          </Pressable>
        </ThemedView>
      </ThemedView>

      <BottomSheet
        ref={bottomSheetRef}
        snapPoints={['70%']}
        enablePanDownToClose
        index={-1}
        onChange={handleSheetChanges}
        backgroundStyle={{ backgroundColor: theme.background }}
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
  overlayContainer: {
    position: 'absolute',
    top: 16,
    left: 16,
    display: 'flex',
    flexDirection: 'row',
    gap: 4,
  },
  overlayButtom: {
    padding: 6,
    borderRadius: 8,
  },
})

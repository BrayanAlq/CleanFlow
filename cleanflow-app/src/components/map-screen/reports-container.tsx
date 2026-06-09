import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { Avatar } from '@/components/ui/avatar'
import { useStompContext } from '@/context/stomp-context'
import { useGetReports } from '@/hooks/use-reports'
import { IReport } from '@/types/reports'
import { formatDateToString } from '@/utils/date-formatter'
import { IMessage } from '@stomp/stompjs'
import { useQueryClient } from '@tanstack/react-query'
import { useEffect, useState } from 'react'
import { Image, Pressable, StyleSheet } from 'react-native'
import { FlatList } from 'react-native-gesture-handler'
import { ImageViewer } from '../ui/image-viewer'

interface IReportContainerProps {
  containerId: number
}

export const ReportsContainer = ({ containerId }: IReportContainerProps) => {
  const [liveReports, setLiveReports] = useState<IReport[]>([])
  const [selectedImage, setSelectedImage] = useState<string | null>(null)

  const { connected, subscribe } = useStompContext()
  const { data, fetchNextPage, hasNextPage } = useGetReports({ containerId, size: 12 })
  const flatData = data?.pages.flatMap(page => page.content) ?? []
  const queryClient = useQueryClient()

  const handleEndReached = () => {
    if (hasNextPage) {
      fetchNextPage()
    }
  }

  useEffect(() => {
    setLiveReports([])
    if (!connected) return
    const sub = subscribe(`/topic/reports/${containerId}`, (message: IMessage) => {
      const newReport = JSON.parse(message.body) as IReport
      setLiveReports(prev => [newReport, ...prev])

      queryClient.invalidateQueries({ queryKey: ['reports', 'container', containerId] })
    })

    return () => sub?.unsubscribe()
  }, [connected, containerId, subscribe, queryClient])

  const joinedReports = [...liveReports, ...flatData.filter(r => !liveReports.some(lr => lr.id === r.id))]

  return (
    <ThemedView style={styles.container}>
      <ThemedView>
        <ThemedText style={styles.title}>Reportes</ThemedText>
      </ThemedView>
      {joinedReports.length !== 0 ? (
        <FlatList
          data={joinedReports}
          scrollEnabled={true}
          showsVerticalScrollIndicator={false}
          keyExtractor={item => `${item.id}`}
          style={styles.reportsContainer}
          renderItem={({ item }) => (
            <ThemedView style={styles.reportContainer}>
              <ThemedView style={styles.textPartContainer}>
                <ThemedView style={styles.avatarContainer}>
                  <Avatar firstName={item.user.first_name} lastName={item.user.last_name} />
                </ThemedView>
                <ThemedView style={styles.infoContainer}>
                  <ThemedView style={styles.nameContainer}>
                    <ThemedText>
                      {item.user.first_name} {item.user.last_name}
                    </ThemedText>
                    <ThemedText type="small" themeColor="textSecondary">
                      {formatDateToString(item.timestamp)}
                    </ThemedText>
                  </ThemedView>
                  <ThemedText type="small" themeColor="textSecondary">
                    {item.content}
                  </ThemedText>
                </ThemedView>
              </ThemedView>
              {item.images.length > 0 && (
                <ThemedView style={styles.imagePartContainer}>
                  {item.images?.map(({ id, path }) => (
                    <Pressable key={id} onPress={() => setSelectedImage(path)}>
                      <ThemedView style={styles.imagesWrapper}>
                        <Image source={{ uri: path }} style={styles.imageContainer} />
                      </ThemedView>
                    </Pressable>
                  ))}
                </ThemedView>
              )}
            </ThemedView>
          )}
          ItemSeparatorComponent={() => <ThemedView type="textSecondary" style={styles.separator}></ThemedView>}
          onEndReached={handleEndReached}
        />
      ) : (
        <ThemedText>No hay reportes</ThemedText>
      )}
      <ImageViewer uri={selectedImage} onClose={() => setSelectedImage(null)} />
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 4,
    paddingHorizontal: 16,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
  },
  reportsContainer: {
    marginTop: 4,
    height: 315,
    marginBottom: 4,
  },
  reportContainer: {
    display: 'flex',
    flexDirection: 'column',
    gap: 4,
    alignItems: 'center',
    justifyContent: 'space-between',
    height: 'auto',
  },
  separator: {
    marginVertical: 4,
    height: 1,
  },
  textPartContainer: {
    width: 'auto',
    display: 'flex',
    flexDirection: 'row',
    gap: 4,
    alignItems: 'center',
    height: 50,
  },
  imagePartContainer: {
    height: 50,
    width: '100%',
    display: 'flex',
    flexDirection: 'row',
    gap: 4,
  },
  nameContainer: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  infoContainer: {
    flex: 1,
  },
  avatarContainer: {
    width: 40,
    height: 40,
    borderRadius: '100%',
    overflow: 'hidden',
  },
  imagesWrapper: {
    width: 50,
    height: 50,
    borderRadius: 12,
    overflow: 'hidden',
  },
  imageContainer: {
    width: '100%',
    height: '100%',
  },
})

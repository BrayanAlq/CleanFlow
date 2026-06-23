import { CurrentTargetCard } from '@/components/home/current-target-card'
import { HeaderSection } from '@/components/home/header-section'
import { MainButton } from '@/components/home/main-button'
import { ProgressCard } from '@/components/home/progress-card'
import { RouteSummary } from '@/components/home/route-summary'
import { ThemedView } from '@/components/themed-view'
import { useAuthContext } from '@/context/auth-context'
import { useRouteProgress } from '@/hooks/use-route-progress'
import { parseAge } from '@/utils/date'
import { ScrollView, StyleSheet } from 'react-native'

export default function DriverHome() {
  const { user } = useAuthContext()

  const { data, currentTarget, cursor, totalCount, isRouteFinished } = useRouteProgress()

  const total = data?.total_count ?? 0
  const aliveCount = data?.alive_count ?? 0
  const highPriorityCount = data?.high_priority_count ?? 0
  const airQualityCounts = data?.air_quality_counts ?? {}

  const progress = totalCount > 0 ? cursor / totalCount : 0
  const routeAge = data?.created_at ? parseAge(data.created_at) : ''

  return (
    <ThemedView type="backgroundElement" style={styles.container}>
      <HeaderSection name={user?.first_name} total={total} routeAge={routeAge} />

      <ScrollView style={{ flex: 1 }} showsVerticalScrollIndicator={false} contentContainerStyle={{ gap: 12 }}>
        {total > 0 && (
          <>
            <ProgressCard
              progress={progress}
              isRouteFinished={isRouteFinished}
              cursor={cursor}
              totalCount={totalCount}
            />
            <RouteSummary
              total={total}
              aliveCount={aliveCount}
              highPriorityCount={highPriorityCount}
              airQualityCounts={airQualityCounts}
            />
            {currentTarget && <CurrentTargetCard container={currentTarget} />}
          </>
        )}
      </ScrollView>

      <MainButton />
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16, display: 'flex', flexDirection: 'column', gap: 16 },
})

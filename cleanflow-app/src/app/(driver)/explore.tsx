import { ExploreContentDriver } from '@/components/map-screen/explore-content-driver'
import { StompProvider } from '@/context/stomp-context'

export default function ExploreDriver() {
  return (
    <StompProvider>
      <ExploreContentDriver />
    </StompProvider>
  )
}

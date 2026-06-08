import { ExploreContentResident } from '@/components/map-screen/explore-content-resident'
import { StompProvider } from '@/context/stomp-context'

export default function ExploreResident() {
  return (
    <StompProvider>
      <ExploreContentResident />
    </StompProvider>
  )
}

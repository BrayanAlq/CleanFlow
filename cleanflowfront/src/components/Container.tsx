import { useEffect, useState } from "react"
import { useStoreContainer } from "../store/useStoreContainer"
import { ContainerInfo } from "./ContainerInfo"
import { ReportSection } from "./ReportSection"
import { SendReport } from "./SendReport"
import type { ReportType } from "../models/report.model"
import { useStomp } from "../hooks/useStomp"
import { useQueryClient } from "@tanstack/react-query"

export const Container = () => {
  const selectedId = useStoreContainer((s) => s.selectedId)
  const queryClient = useQueryClient()
  const [liveReports, setLiveReports] = useState<ReportType[]>([])

  useEffect(() => {
    setLiveReports([])
  }, [selectedId])

  const { sendMessage } = useStomp(
    `/topic/reports/${selectedId}`,
    (newReport: ReportType) => {
      setLiveReports((prev) => [newReport, ...prev])

      queryClient.invalidateQueries({
        queryKey: ['reports', 'container', selectedId],
      })
    }
  )

  return (
    <>
      {
        selectedId && (
          <div
            className="absolute w-90 h-auto rounded-2xl bg-bg-secondary top-5 right-5 z-1000 border-border-accent border-[0.1px] shadow-2xs overflow-hidden flex flex-col"
          >
            <ContainerInfo />
            <ReportSection liveReports={liveReports} />
            <SendReport sendMessage={sendMessage} />
          </div>
        )
      }
    </>
  )
}
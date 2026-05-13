import { useEffect, useState } from "react"
import { useStoreContainer } from "../store/useStoreContainer"
import { ContainerInfo } from "./ContainerInfo"
import { ReportSection } from "./ReportSection"
import { SendReport } from "./SendReport"
import type { ReportType } from "../models/report.model"
import { useQueryClient } from "@tanstack/react-query"
import { useStomp } from "../context/StompContext"
import type { IMessage } from "@stomp/stompjs"

export const Container = () => {
  const selectedId = useStoreContainer((s) => s.selectedId)
  const queryClient = useQueryClient()
  const [liveReports, setLiveReports] = useState<ReportType[]>([])

  const { connected, subscribe } = useStomp()

  useEffect(() => {
    setLiveReports([])
  }, [selectedId])

  useEffect(() => {
    const sub = subscribe(
      `/topic/reports/${selectedId}`,
      (msg: IMessage) => {
        const newReport = JSON.parse(msg.body) as ReportType
        setLiveReports((prev) => [newReport, ...prev])
  
        queryClient.invalidateQueries({
          queryKey: ['reports', 'container', selectedId],
        })
      }
    )

    return () => sub?.unsubscribe()
  }, [connected, selectedId])

  return (
    <>
      {
        selectedId && (
          <div
            className="absolute w-90 h-auto rounded-2xl bg-bg-secondary top-5 right-5 z-1000 border-border-accent border-[0.1px] shadow-2xs overflow-hidden flex flex-col"
          >
            <ContainerInfo />
            <ReportSection liveReports={liveReports} />
            <SendReport />
          </div>
        )
      }
    </>
  )
}
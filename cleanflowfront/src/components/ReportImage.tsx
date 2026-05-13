import { ExpandableImage } from "./ExpandableImage"

type ReportImageProps = {
  id: number,
  path: string,
}

export const ReportImage = ({ path }: ReportImageProps) => {
  return (
    <ExpandableImage path={path}>
      <img
        src={path}
        alt="report-image"
        className="w-10 h-10 object-cover object-center rounded-full cursor-pointer hover:opacity-80"
      />
    </ExpandableImage>
  )
}
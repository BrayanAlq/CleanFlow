import { Client } from "@stomp/stompjs"
import SockJS from "sockjs-client"

import polyline from "@mapbox/polyline"

const API_URL = "http://localhost:8080"
const JWT_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MiwiZmlyc3RfbmFtZSI6Ikp1YW4iLCJsYXN0X25hbWUiOiJEcml2ZXIiLCJ1c2VybmFtZSI6ImRyaXZlcjEiLCJyb2xlIjoiRFJJVkVSIiwiZXhwIjoxNzgxNTc2MzA3fQ.0L2_BtSRVeXBD-c9L6JV8G2pWZWwQGDumEIESiOxhi4"

const POLYLINE = 'nfwhAxdbuMw@PeBJm@Hk@D]DYBW@YBYBWD]@W@WBWDYFW?W@M@?TBTBTDT@PDZ@JBVDZ@TBT@VFPBT@TI@KCMEOEOCQIYAUCMCSEQAQCOAMCQCOCOCMAIAOAQEOCMAMAOCOCQAOEQCSAS?UCWCWEQCQCUAUEB]AU?OCSCQEUIOGMDEDCFEFEFGDCFEFEHEDEFCFGDEFCFEDCFEDEFEDCEIGGIIGIIIIGEGIGKIKIKGKEGEOEIEIEKEKCOCKCKAMAKEM?OAK?K?Q?O?M?MBQBM@MBQBKDKBQFKDMFKFOHOJOLIHGDKHEJGFEFGDCFDDHFDDHBHFDDFDDBBBBBB@BB@@B@B@BBB@B@@BB@DB@BB@BBD@BBB@BBB@ADCDABADCBAFCFCHCHAFAH?D?FAJ?F?F@H?F@F@D?F@D?DC@EBE@I@GBE@EBG@E@EBE@G@IBG@GBEBG@IBG@EBIBG@C@IBGBG@IBGBG@GBIBCBG@G@GBGBE@GBI@GBGBG@EB'

const client = new Client({
  webSocketFactory: () => new SockJS(`${API_URL}/ws`),
  reconnectDelay: 1000,
  connectHeaders: { Authorization: `Bearer ${JWT_TOKEN}` },
  onConnect: () => {
    console.log("Connected")

    const polylineDecoded = polyline.decode(POLYLINE)

    polylineDecoded.forEach(([lat, lng], index) => {
      setTimeout(() => {
        client.publish({
          destination: "/app/driver.location",
          body: JSON.stringify({
            latitude: lat,
            longitude: lng
          })
        })
        console.log({
          latitude: lat,
          longitude: lng
        })
      }, index * 500)

    })
  },
  onStompError: (frame) => {
    console.error('STOMP error: ', frame)
  }
})

client.activate()

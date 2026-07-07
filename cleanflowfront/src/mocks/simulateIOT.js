import { Client } from '@stomp/stompjs'
import axios from 'axios'
import SockJS from 'sockjs-client'

const API_URL = 'http://localhost:8080'

const getCredentials = async () => {
  const response = await axios.get(`${API_URL}/container/device`)
  return response.data // { api_key, secret }
}

const fillingLevelArray = [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
const isAliveArray = [true, false]
const airQualityLevelArray = ['NO_DATA', 'VERY_GOOD', 'GOOD', 'REGULAR', 'BAD', 'VERY_BAD']
const ppmArray = [0.2, 10.3, 5.4, 2.5, 12.6, 0.7]

const getRandomFillingLevel = () => {
  return fillingLevelArray[Math.floor(Math.random() * fillingLevelArray.length)]
}

const getRandomIsAlive = () => {
  return isAliveArray[Math.floor(Math.random() * isAliveArray.length)]
}

const getRandomAirQualityLevel = () => {
  return airQualityLevelArray[Math.floor(Math.random() * airQualityLevelArray.length)]
}

const getRandomPpm = () => {
  return ppmArray[Math.floor(Math.random() * ppmArray.length)]
}

getCredentials()
  .then(({ api_key, secret }) => {
    console.log('Credentials received', api_key, secret)
    const client = new Client({
      webSocketFactory: () => new SockJS(`${API_URL}/ws`),
      reconnectDelay: 1000,
      connectHeaders: {
        'X-Api-Key': api_key,
        'X-Secret': secret,
      },
      onConnect: () => {
        console.log('Connected')

        setInterval(() => {
          const fillingLevel = getRandomFillingLevel()
          const isAlive = getRandomIsAlive()
          const airQualityLevel = getRandomAirQualityLevel()
          const ppm = getRandomPpm()

          client.publish({
            destination: '/app/container.metrics',
            body: JSON.stringify({
              is_alive: isAlive,
              air_quality_level: airQualityLevel,
              ppm: ppm,
              filling_level: fillingLevel,
            }),
          })

          console.log({
            isAlive,
            airQualityLevel,
            ppm,
            fillingLevel,
          })
        }, 3000)
      },
      onStompError: frame => {
        console.error('STOMP error: ', frame)
      },
    })

    client.activate()
  })
  .catch(err => {
    console.error(err)
  })

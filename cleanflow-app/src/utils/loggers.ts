import Logger from '@/utils/logger'

const loggers = {
  location: new Logger({ enabled: false, minLevel: 'debug', namespace: 'LOCATION_SERVICE' }),
  backgroundLocation: new Logger({ enabled: false, minLevel: 'debug', namespace: 'BACKGROUND_SERVICE' }),
  driverTrip: new Logger({ enabled: false, minLevel: 'debug', namespace: 'DRIVER_TRIP_CONTEXT' }),
  hookCurrentLocation: new Logger({ enabled: false, minLevel: 'debug', namespace: 'HOOK_CURRENT_LOCATION' }),
  driverLayout: new Logger({ enabled: false, minLevel: 'debug', namespace: 'DRIVER_LAYOUT' }),
  stompContext: new Logger({ enabled: false, minLevel: 'debug', namespace: 'STOMP_CONTEXT' }),
  driverHome: new Logger({ enabled: false, minLevel: 'debug', namespace: 'DRIVER_HOME' }),
  api: new Logger({ enabled: false, minLevel: 'debug', namespace: 'API' }),
}

type LoggerNamespaces = keyof typeof loggers

export const loggersConfig = {
  enableCustom: (namespaces: LoggerNamespaces[]) => {
    if (namespaces.length === 0) {
      Object.values(loggers).forEach(log => log.setEnabled(true))
    } else {
      namespaces.forEach(namespace => loggers[namespace].setEnabled(true))
    }
  },
  disableExceptions: (namespaces: LoggerNamespaces[]) => {
    Object.keys(loggers).forEach(log => {
      if (namespaces.includes(log as LoggerNamespaces)) {
        loggers[log as LoggerNamespaces].setEnabled(false)
      }
      loggers[log as LoggerNamespaces].setEnabled(true)
    })
  },
}

loggersConfig.enableCustom(['api', 'stompContext'])

export default loggers

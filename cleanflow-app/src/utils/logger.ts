type LogLevel = 'debug' | 'info' | 'warn' | 'error'

interface LoggerConfig {
  enabled: boolean
  minLevel: LogLevel
  namespace?: string
}

const LOG_LEVELS = { debug: 0, info: 1, warn: 2, error: 3 }

class Logger {
  private config: LoggerConfig

  constructor(config: LoggerConfig = { enabled: true, minLevel: 'debug' }) {
    this.config = config
  }

  private shouldLog(level: LogLevel): boolean {
    if (!this.config.enabled) return false
    return LOG_LEVELS[level] >= LOG_LEVELS[this.config.minLevel]
  }

  private formatMessage(level: LogLevel, message: string): string {
    const namespace = this.config.namespace ? `[${this.config.namespace}]` : ''
    return `${namespace} ${message}`
  }

  debug(message: string, data?: any) {
    if (this.shouldLog('debug')) {
      console.log(this.formatMessage('debug', message), data ?? '')
    }
  }

  info(message: string, data?: any) {
    if (this.shouldLog('info')) {
      console.log(this.formatMessage('info', message), data ?? '')
    }
  }

  warn(message: string, data?: any) {
    if (this.shouldLog('warn')) {
      console.warn(this.formatMessage('warn', message), data ?? '')
    }
  }

  error(message: string, error?: any) {
    if (this.shouldLog('error')) {
      console.error(this.formatMessage('error', message), error ?? '')
    }
  }

  setEnabled(enabled: boolean) {
    this.config.enabled = enabled
  }

  setMinLevel(level: LogLevel) {
    this.config.minLevel = level
  }
}

export default Logger

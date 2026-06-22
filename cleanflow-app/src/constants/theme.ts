/**
 * Below are the colors that are used in the app. The colors are defined in the light and dark mode.
 * There are many other ways to style your app. For example, [Nativewind](https://www.nativewind.dev/), [Tamagui](https://tamagui.dev/), [unistyles](https://reactnativeunistyles.vercel.app), etc.
 */

import '@/global.css'

import { Platform } from 'react-native'

export const Colors = {
  light: {
    text: '#000000',
    background: '#ffffff',
    backgroundElement: '#F0F0F3',
    backgroundSelected: '#E0E1E6',
    textSecondary: '#60646C',
    borderError: '#e53935',
    borderColor: 'transparent',
    greenAccent: '#2e7d32',
    greenBackground: '#d0e8d0',
    textError: '#e53935',
    borderTabColor: '#E0E1E6',
    badgeInfoBorder: '#2e7d32',
    borderDriverMarker: '#FFFFFF',
    paddingColorDriverMarker: '#4285F4',
    backgroundDriverMarker: '#1A73E8',
    transparent: 'transparent',
    backgroundMineMarker: '#2e7d32',
    overlayActive: '#258EA6',
  },
  dark: {
    text: '#fff',
    background: '#212225',
    backgroundElement: '#000000',
    backgroundSelected: '#2E3135',
    textSecondary: '#B0B4BA',
    borderError: '#e53935',
    borderColor: 'transparent',
    greenAccent: '#2e7d32',
    greenBackground: '#d0e8d0',
    textError: '#e53935',
    borderTabColor: '#E0E1E6',
    badgeInfoBorder: '#fff',
    borderDriverMarker: '#FFFFFF',
    paddingColorDriverMarker: '#4285F4',
    backgroundDriverMarker: '#1A73E8',
    transparent: 'transparent',
    backgroundMineMarker: '#2e7d32',
    overlayActive: '#258EA6',
  },
} as const

export type ThemeColor = keyof typeof Colors.light & keyof typeof Colors.dark

export const Fonts = Platform.select({
  ios: {
    /** iOS `UIFontDescriptorSystemDesignDefault` */
    sans: 'system-ui',
    /** iOS `UIFontDescriptorSystemDesignSerif` */
    serif: 'ui-serif',
    /** iOS `UIFontDescriptorSystemDesignRounded` */
    rounded: 'ui-rounded',
    /** iOS `UIFontDescriptorSystemDesignMonospaced` */
    mono: 'ui-monospace',
  },
  default: {
    sans: 'normal',
    serif: 'serif',
    rounded: 'normal',
    mono: 'monospace',
  },
  web: {
    sans: 'var(--font-display)',
    serif: 'var(--font-serif)',
    rounded: 'var(--font-rounded)',
    mono: 'var(--font-mono)',
  },
})

export const Spacing = {
  half: 2,
  one: 4,
  two: 8,
  three: 16,
  four: 24,
  five: 32,
  six: 64,
} as const

export const BottomTabInset = Platform.select({ ios: 50, android: 80 }) ?? 0
export const MaxContentWidth = 800

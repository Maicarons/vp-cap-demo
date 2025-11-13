import DefaultTheme from 'vitepress/theme'
import { Capacitor } from '@capacitor/core'
import CallCamera from './components/CallCamera.vue'

export default {
  ...DefaultTheme,
  enhanceApp({ app }) {
    app.component('CallCamera', CallCamera)
    app.config.globalProperties.$Capacitor = Capacitor
  },
}
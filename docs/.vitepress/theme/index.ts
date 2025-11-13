import { h } from "vue";
import type { Theme } from "vitepress";
import DefaultTheme from "vitepress/theme";
import "./style.css";
import CallCamera from "./components/CallCamera.vue";
import PrimaryButton from "./components/PrimaryButton.vue";
import { Capacitor } from '@capacitor/core';
import NotifyDemo from './components/NotifyDemo.vue'
import GeoDemo from './components/GeoDemo.vue'
import StorageDemo from './components/StorageDemo.vue'
import HapticsDemo from './components/HapticsDemo.vue'
import DeviceDemo from './components/DeviceDemo.vue'
import NetworkDemo from './components/NetworkDemo.vue'

export default {
  extends: DefaultTheme,
  Layout: () => {
    return h(DefaultTheme.Layout, null, {});
  },
  enhanceApp({ app, router, siteData }) {
    app.component('CallCamera', CallCamera)
    app.component('PrimaryButton', PrimaryButton)
    app.component('NotifyDemo', NotifyDemo)
    app.component('GeoDemo', GeoDemo)
    app.component('StorageDemo', StorageDemo)
    app.component('HapticsDemo', HapticsDemo)
    app.component('DeviceDemo', DeviceDemo)
    app.component('NetworkDemo', NetworkDemo)
    app.config.globalProperties.$Capacitor = Capacitor
 
  },
} satisfies Theme;
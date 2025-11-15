import type { Theme } from "vitepress";
import DefaultTheme from "vitepress/theme";
import "./style.css";
import { Capacitor } from "@capacitor/core";

// @ts-ignore - import.meta.glob is a Vite API
const components = import.meta.glob("./components/**/*.vue", { eager: true });
const view = import.meta.glob("./view/**/*.vue", { eager: true });
import BottomBar from "./components/BottomBar.vue";

import "element-plus/dist/index.css";
import "element-plus/theme-chalk/dark/css-vars.css";

import "virtual:uno.css";

export default {
  extends: DefaultTheme,
  Layout: () => {
    // 在默认布局后渲染 BottomBar（固定在页面底部）
    return h("div", [h(DefaultTheme.Layout), h(BottomBar)]);
  },
  enhanceApp({ app, router, siteData }) {
    // 动态注册所有组件
    for (const [path, module] of Object.entries(components)) {
      const componentName =
        path
          .split("/")
          .pop()
          ?.replace(/\.vue$/, "") || "";
      app.component(componentName, (module as any).default);
    }
    for (const [path, module] of Object.entries(view)) {
      const componentName =
        path
          .split("/")
          .pop()
          ?.replace(/\.vue$/, "") || "";
      app.component(componentName, (module as any).default);
    }
    app.config.globalProperties.$Capacitor = Capacitor;
  },
} satisfies Theme;

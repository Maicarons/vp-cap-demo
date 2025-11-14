import { defineConfig } from 'vitepress'
import markdownItAnchor from "markdown-it-anchor";
import markdownItMark from "markdown-it-mark";
import markdownItAbbr from "markdown-it-abbr";
import markdownItFootnote from "markdown-it-footnote";
import { generateSidebar } from "vitepress-sidebar";

export default defineConfig({
  title: 'VP + Capacitor Demo',
  description: 'Markdown 驱动的移动原生应用框架',
  head: [
    ['link', { rel: 'icon', href: '/favicon.svg' }],
    ['meta', { name: 'theme-color', content: '#4f46e5' }]
  ],
  lang: "zh-CN",
  markdown: {
    math: true,
    lineNumbers: true,
    image: {
      lazyLoading: true,
    },
    anchor: {
      permalink: markdownItAnchor.permalink.linkInsideHeader({
        symbol: "",
        space: true,
      }),
    },
    config: (md) => {
      md.use(markdownItMark).use(markdownItAbbr).use(markdownItFootnote);
    },
  },
  themeConfig: {
    logo: '/favicon.svg',
    search: {
      provider: 'local'
    },
    nav: [
      { text: '首页', link: '/' },
      { text: '指南', link: '/guide/' },
      { text: '功能组件', link: '/feature/' },
      { text: '关于', link: '/about/' }
    ],
    sidebar: generateSidebar({
      documentRootPath: "docs",
      useFolderTitleFromIndexFile: true,
      useFolderLinkFromIndexFile: true,
      useTitleFromFileHeading: true,
      collapsed: true,
    }),
    socialLinks: [
      { icon: 'github', link: 'https://github.com/maicarons/vp-cap-demo' }
    ]
  }
})
# 快速开始

欢迎使用 VP + Capacitor Demo！本指南将帮助你快速上手这个项目。

## 前置要求

在开始之前，请确保你已安装：

- **Node.js** (v18+)
- **Bun** 包管理器 (或 npm/yarn)
- **Java Development Kit (JDK)** 17+
- **Android SDK** (用于构建 APK)
- **Git**

## 项目设置

### 1. 克隆或初始化项目

```bash
cd /workspaces/vp-cap-demo
```

### 2. 安装依赖

```bash
# 使用 Bun
bun install

# 或使用 npm
npm install
```

### 3. 安装必要的包

```bash
# VitePress、Vue 和 Capacitor 核心包
bun add vitepress vue @capacitor/core @capacitor/cli @capacitor/android @capacitor/camera
```

## 开发服务器

启动开发服务器查看实时更改：

```bash
# 运行 VitePress 开发服务器
bun run docs:dev
```

访问 `http://localhost:5173` 查看你的文档网站。

## 项目结构

```
vp-cap-demo/
├── docs/                          # 文档源文件
│   ├── index.md                  # 首页
│   ├── guide/                    # 指南
│   │   ├── getting-started.md   # 本文件
│   │   ├── capacitor.md
│   │   └── camera.md
│   ├── docs/                     # 文档
│   │   ├── project-structure.md
│   │   └── api.md
│   └── .vitepress/               # VitePress 配置
│       ├── config.ts             # 主要配置
│       └── theme/
│           ├── index.ts          # 主题配置
│           └── components/
│               └── CallCamera.vue
├── public/                       # 静态资源
│   ├── logo.svg
│   └── favicon.svg
├── android/                      # Android 项目
├── package.json
├── capacitor.config.ts
├── vite.config.ts
└── build-apk.sh                 # APK 构建脚本
```

## 常用命令

```bash
# 开发
bun run docs:dev          # 启动开发服务器

# 构建
bun run docs:build        # 构建生产版文档

# Android
bunx cap sync             # 同步 Capacitor 配置
bunx cap build android    # 构建 Android 项目
./build-apk.sh           # 构建 APK（完整流程）
```

## 下一步

- 查看 [Capacitor 配置](/guide/capacitor) 了解如何设置原生功能
- 学习 [摄像头功能](/guide/camera) 如何使用相机 API
- 阅读 [项目结构](/docs/project-structure) 了解代码组织

## 获取帮助

如有问题，请：

1. 查看 [官方 VitePress 文档](https://vitepress.dev/)
2. 查看 [Capacitor 文档](https://capacitorjs.com/)
3. 在 [GitHub](https://github.com/maicarons/vp-cap-demo) 上提出 Issue

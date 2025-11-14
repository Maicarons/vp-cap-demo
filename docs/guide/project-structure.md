# 项目结构

本文档详细介绍 VP Cap Demo 项目的目录结构和各文件的用途。

## 完整目录树

```
vp-cap-demo/
├── docs/                              # VitePress 文档源
│   ├── index.md                      # 首页（Hero 布局）
│   ├── guide/                        # 指南目录
│   │   ├── getting-started.md       # 快速开始
│   │   ├── capacitor.md             # Capacitor 配置
│   │   └── camera.md                # 摄像头功能
│   ├── docs/                         # 文档目录
│   │   ├── project-structure.md     # 项目结构（本文件）
│   │   └── api.md                   # API 参考
│   └── .vitepress/                   # VitePress 配置目录
│       ├── config.ts                # 主要配置文件
│       └── theme/
│           ├── index.ts             # 主题入口
│           └── components/
│               └── CallCamera.vue   # 相机组件
│
├── public/                            # 静态资源
│   ├── logo.svg                     # 网站 Logo
│   └── favicon.svg                  # 网站 Favicon
│
├── android/                           # Android 原生项目
│   ├── app/                         # Android App 模块
│   │   ├── src/
│   │   │   ├── main/               # 主源代码
│   │   │   ├── androidTest/        # Android 测试
│   │   │   └── test/               # 单元测试
│   │   ├── build.gradle            # App 级 Gradle 配置
│   │   └── proguard-rules.pro       # ProGuard 混淆规则
│   ├── gradle/                      # Gradle 配置
│   │   └── wrapper/                # Gradle Wrapper
│   ├── build.gradle                # 项目级 Gradle 配置
│   ├── settings.gradle             # Gradle 设置
│   ├── gradlew                     # Gradle Wrapper 脚本（Linux/Mac）
│   ├── gradlew.bat                 # Gradle Wrapper 脚本（Windows）
│   └── capacitor-cordova-android-plugins/  # Cordova 插件
│
├── dist/                             # 构建输出目录（VitePress）
│   └── [生成的静态文件]
│
├── node_modules/                     # npm 依赖包
│   └── [安装的依赖]
│
├── capacitor.config.ts              # Capacitor 配置
├── vite.config.ts                   # Vite 构建配置
├── package.json                     # 项目依赖和脚本
├── package-lock.json                # 依赖版本锁定（如使用 npm）
├── bun.lockb                        # 依赖版本锁定（如使用 Bun）
├── build-apk.sh                     # APK 构建脚本
├── README.md                        # 项目说明文档
└── .gitignore                       # Git 忽略文件
```

## 核心文件说明

### 配置文件

| 文件 | 用途 |
|------|------|
| `capacitor.config.ts` | Capacitor 配置，定义应用信息和平台特定设置 |
| `vite.config.ts` | Vite 打包配置，控制构建行为 |
| `package.json` | 项目依赖、脚本命令和元数据 |
| `docs/.vitepress/config.ts` | VitePress 文档配置，定义导航、侧边栏等 |

### 文档文件

| 目录 | 用途 |
|------|------|
| `docs/` | VitePress 文档源文件（Markdown） |
| `docs/guide/` | 入门指南和教程 |
| `docs/docs/` | API 文档和参考 |
| `docs/.vitepress/` | VitePress 配置和主题 |

### 组件文件

| 文件 | 用途 |
|------|------|
| `docs/.vitepress/theme/index.ts` | 主题入口，注册全局组件 |
| `docs/.vitepress/theme/components/CallCamera.vue` | 相机功能组件 |

### 脚本文件

| 文件 | 用途 |
|------|------|
| `build-apk.sh` | 自动化 APK 构建脚本 |
| `android/gradlew` | Android 构建工具（Linux/Mac） |
| `android/gradlew.bat` | Android 构建工具（Windows） |

## 开发工作流

```
源码编辑
    ↓
docs/*.md (写文档)
docs/.vitepress/ (配置)
    ↓
npm run docs:dev (开发预览)
    ↓
修改和测试
    ↓
npm run docs:build (生成静态文件)
    ↓
dist/ (生成的网站)
    ↓
bunx cap sync (同步到 Android)
    ↓
./build-apk.sh (构建 APK)
    ↓
android/*.apk (生成的应用)
```

## 忽略文件

`.gitignore` 应包含：

```
node_modules/
dist/
.DS_Store
android/.gradle/
android/.idea/
android/app/build/
*.log
*.local
```

## 环境变量

如需使用环境变量，在项目根目录创建 `.env` 文件：

```
VITE_API_URL=https://api.example.com
VITE_APP_ID=your_app_id
```

在代码中使用：

```typescript
const apiUrl = import.meta.env.VITE_API_URL
```

## 构建输出

### VitePress 构建

```bash
npm run docs:build
```

输出到 `dist/` 目录，包含：

- 静态 HTML 文件
- CSS 资源
- JavaScript 代码
- 优化的图片

### Android 构建

```bash
./build-apk.sh
```

输出 APK 文件到 `android/app/build/outputs/apk/`

## 扩展项目

添加新页面：

```bash
# 在 docs/guide/ 下创建新文件
echo "# 新指南" > docs/guide/new-guide.md

# 在 config.ts 中更新侧边栏
```

添加新组件：

```bash
# 创建组件文件
touch docs/.vitepress/theme/components/MyComponent.vue

# 在 theme/index.ts 中注册
app.component('MyComponent', MyComponent)
```

## 下一步

- 查看 [快速开始](/guide/getting-started) 开始开发
- 阅读 [API 参考](/docs/api) 了解可用的 API

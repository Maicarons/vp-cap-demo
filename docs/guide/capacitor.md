# Capacitor 配置

本指南介绍如何配置和使用 Capacitor 为你的应用添加原生功能。

## 什么是 Capacitor？

Capacitor 是一个开源框架，用于使用 Web 技术（HTML、CSS、JavaScript）构建原生 iOS 和 Android 应用。它提供了一个统一的 JavaScript API 来访问原生设备功能。

## 初始化 Capacitor

如果尚未初始化，运行：

```bash
bunx cap init
```

系统会提示你输入：
- **应用名称**：例如 "VP Cap Demo"
- **应用包名**：例如 "com.example.vpcapdemo"
- **应用目录**：通常为 "dist"

## 添加 Android 平台

```bash
bunx cap add android
```

这将创建 `android/` 目录，包含完整的 Android 项目。

## Capacitor 配置文件

编辑 `capacitor.config.ts`：

```typescript
import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.example.vpcapdemo',
  appName: 'VP Cap Demo',
  webDir: 'dist',
  bundledWebRuntime: false,
  plugins: {
    Camera: {
      permissions: ['camera', 'photos']
    }
  }
};

export default config;
```

## Android 权限

编辑 `android/app/src/main/AndroidManifest.xml` 添加权限：

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

## 同步和构建

### 同步 Web 资源

```bash
# 构建 Web 内容并同步到 Android
bunx cap sync

# 或仅同步，不构建
bunx cap copy
```

### 构建 Android

```bash
# 打开 Android Studio
bunx cap open android

# 或使用命令行构建
cd android
./gradlew build
```

## 测试

### 在开发模式运行

1. 启动 Capacitor Live Reload 服务器
2. 在 Android Studio 中运行应用
3. 实时查看代码更改

### 调试

使用 Chrome DevTools 调试：

1. 在 Android 设备上打开应用
2. 在 Chrome 中访问 `chrome://inspect`
3. 选择你的设备和 WebView 进行调试

## 常见问题

**Q: 如何处理权限请求？**
A: Capacitor 会自动处理 Android 6.0+ 的运行时权限。你可以使用 `@capacitor/core` 的权限 API。

**Q: 如何添加自定义原生代码？**
A: 在 `android/app/src/main/java` 中添加 Java 代码，然后使用 Capacitor 的插件系统暴露给 JavaScript。

**Q: 支持哪些平台？**
A: Capacitor 支持 iOS、Android、Web 和 Electron。

## 下一步

- 阅读 [官方 Capacitor 文档](https://capacitorjs.com/docs)

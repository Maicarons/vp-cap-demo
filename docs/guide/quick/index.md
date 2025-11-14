# 快速开始

欢迎使用 VP Capacitor Demo！本指南将帮助你快速上手这个项目。

## 前置要求

在开始之前，请确保你已安装：

- **Node.js** (v18+)
- **Bun** 包管理器 (或 npm/yarn)
- **Java Development Kit (JDK)** 17+
- **Android SDK** (用于构建 APK)
- **Git**

## 开始你的炸弹秀

### 克隆项目

```bash
cd /workspaces/vp-cap-demo
```

### 安装依赖

```bash
# 使用 Bun
bun install

# 或使用 npm (用啥随意，文档里全都用Bun，请自行替换)
npm install
```

## 前端测试

启动开发服务器查看实时更改：

```bash
# 运行 VitePress 开发服务器
bun run docs:dev
```
访问 `http://localhost:5173` 查看你的网站，确认无误后终止命令，继续下一步。


## 编译应用

```bash
bun run full:build
```

## 获取帮助

如有问题，请：

1. 查看 [官方 VitePress 文档](https://vitepress.dev/)
2. 查看 [Capacitor 文档](https://capacitorjs.com/)
3. 在 [GitHub](https://github.com/maicarons/vp-cap-demo) 上提出 Issue

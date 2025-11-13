# API 参考

本文档提供 VP Cap Demo 中使用的主要 API 和库的参考。

## Capacitor Core API

### Camera API

拍照和选择图片功能。

```typescript
import { Camera, CameraResultType, CameraSource } from '@capacitor/camera'

// 拍照
const image = await Camera.getPhoto({
  quality: 90,
  allowEditing: false,
  resultType: CameraResultType.Uri,
  source: CameraSource.Camera
})

// 从相册选择
const image = await Camera.getPhoto({
  source: CameraSource.Photos,
  resultType: CameraResultType.Uri
})

// 获取 Base64
const image = await Camera.getPhoto({
  resultType: CameraResultType.Base64
})
```

**返回值**:
```typescript
{
  webPath?: string          // Web 访问路径
  exif?: Exif              // EXIF 元数据
  format: string           // 图像格式
  saved?: boolean          // 是否已保存
  base64String?: string    // Base64 编码数据
}
```

**选项**:
- `quality`: 0-100，图像质量
- `allowEditing`: boolean，是否允许编辑
- `resultType`: Uri, Base64, Base64String
- `source`: Camera, Photos, Prompt
- `width`: number，输出宽度
- `height`: number，输出高度

### Filesystem API

文件系统操作。

```typescript
import { Filesystem, Directory, Encoding } from '@capacitor/filesystem'

// 写文件
await Filesystem.writeFile({
  path: 'myfile.txt',
  data: 'Hello World',
  directory: Directory.Data,
  encoding: Encoding.UTF8
})

// 读文件
const contents = await Filesystem.readFile({
  path: 'myfile.txt',
  directory: Directory.Data,
  encoding: Encoding.UTF8
})

// 删除文件
await Filesystem.deleteFile({
  path: 'myfile.txt',
  directory: Directory.Data
})

// 列出目录
const result = await Filesystem.readdir({
  path: '/',
  directory: Directory.Data
})
```

## VitePress API

### 在 Markdown 中使用 Vue

```markdown
# 标题

<script setup>
import { ref } from 'vue'
const count = ref(0)
</script>

按钮点击次数：{{ count }}

<button @click="count++">点击我</button>
```

### 导入组件

```typescript
// .vitepress/theme/index.ts
import { h } from 'vue'
import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme'
import MyComponent from './components/MyComponent.vue'

export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    app.component('MyComponent', MyComponent)
  }
} satisfies Theme
```

### 配置选项

```typescript
// config.ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  title: '网站标题',
  description: '网站描述',
  head: [
    ['link', { rel: 'icon', href: '/logo.svg' }]
  ],
  themeConfig: {
    logo: '/logo.svg',
    nav: [
      { text: '首页', link: '/' },
      { text: '指南', link: '/guide/' }
    ],
    sidebar: [
      {
        text: '分组',
        items: [
          { text: '项目 1', link: '/guide/page1' }
        ]
      }
    ]
  }
})
```

## Vue 3 API

### Composition API

```typescript
import { ref, computed, watch } from 'vue'

// 响应式数据
const count = ref(0)
const doubled = computed(() => count.value * 2)

// 监听数据变化
watch(count, (newVal, oldVal) => {
  console.log(`count 从 ${oldVal} 变为 ${newVal}`)
})

// 生命周期
import { onMounted, onUnmounted } from 'vue'

onMounted(() => {
  console.log('组件已挂载')
})

onUnmounted(() => {
  console.log('组件已卸载')
})
```

### 模板语法

```vue
<!-- 插值 -->
<p>{{ message }}</p>

<!-- 条件渲染 -->
<div v-if="visible">显示</div>
<div v-else>隐藏</div>

<!-- 列表渲染 -->
<li v-for="item in items" :key="item.id">{{ item.name }}</li>

<!-- 事件处理 -->
<button @click="handleClick">点击</button>

<!-- 数据绑定 -->
<input v-model="message" />
```

## 常用工具函数

### 调试日志

```typescript
console.log('普通日志')
console.warn('警告信息')
console.error('错误信息')
```

### 异步处理

```typescript
// async/await
async function fetchData() {
  try {
    const response = await fetch('/api/data')
    const data = await response.json()
    return data
  } catch (error) {
    console.error('请求失败:', error)
  }
}

// Promise
fetch('/api/data')
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error))
```

## TypeScript 类型

### 常用类型定义

```typescript
// 函数参数类型
function greet(name: string): void {
  console.log(`Hello, ${name}`)
}

// 接口定义
interface Photo {
  webPath?: string
  format: string
  exif?: any
}

// 类型别名
type PhotoResult = Photo & { success: boolean }

// 泛型
function getValue<T>(value: T): T {
  return value
}
```

## 相关文档链接

- [Capacitor 官方文档](https://capacitorjs.com/docs)
- [VitePress 官方文档](https://vitepress.dev/)
- [Vue 3 文档](https://vuejs.org/)
- [TypeScript 文档](https://www.typescriptlang.org/)

## 常见问题

**Q: 如何获取当前平台信息？**

```typescript
import { Platform } from '@capacitor/core'

const isAndroid = Platform.is('android')
const isIos = Platform.is('ios')
const isWeb = Platform.is('web')
```

**Q: 如何处理错误？**

```typescript
try {
  await Camera.getPhoto({ ... })
} catch (error) {
  if (error instanceof Error) {
    console.error(error.message)
  }
}
```

**Q: 如何访问环境变量？**

```typescript
const apiUrl = import.meta.env.VITE_API_URL
```

## 下一步

- 查看 [摄像头功能](/guide/camera) 了解相机使用
- 阅读 [Capacitor 配置](/guide/capacitor) 学习原生集成

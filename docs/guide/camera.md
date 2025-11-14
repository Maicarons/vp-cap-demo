# 摄像头功能

学习如何使用 CallCamera 组件集成摄像头功能。

## 概述

`CallCamera` 组件使用 Capacitor 的 Camera API 提供简单的照片拍摄功能。它处理权限请求、图像捕获和显示。

## 组件源码

组件位于 `docs/.vitepress/theme/components/CallCamera.vue`：

```vue
<template>
  <div class="camera-container">
    <button @click="takePhoto">Take Photo</button>
    <img v-if="photoSrc" :src="photoSrc" alt="Captured photo" />
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { Camera, CameraResultType } from '@capacitor/camera'

const photoSrc = ref<string>('')

const takePhoto = async () => {
  try {
    const image = await Camera.getPhoto({
      quality: 90,
      allowEditing: false,
      resultType: CameraResultType.Uri
    })
    photoSrc.value = image.webPath || ''
  } catch (error) {
    console.error('Error taking photo:', error)
  }
}
</script>

<style scoped>
.camera-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  padding: 1rem;
}

button {
  padding: 0.5rem 1rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
}

button:hover {
  background-color: #0056b3;
}

img {
  max-width: 100%;
  max-height: 500px;
  border-radius: 4px;
}
</style>
```

## 使用方法

### 在文档中使用

在任何 Markdown 文件中使用组件：

```markdown
# 我的相机演示

<CallCamera />
```

### 在 Vue 组件中使用

```vue
<template>
  <div>
    <h1>拍照示例</h1>
    <CallCamera />
  </div>
</template>

<script setup>
import CallCamera from '@/.vitepress/theme/components/CallCamera.vue'
</script>
```

## Camera API 选项

`getPhoto()` 方法支持以下选项：

| 选项 | 类型 | 说明 |
|------|------|------|
| `quality` | number | 图像质量 (0-100) |
| `allowEditing` | boolean | 允许用户编辑照片 |
| `resultType` | enum | 返回结果类型 (Uri, Base64, Base64String) |
| `source` | enum | 图像源 (Prompt, Camera, Photos) |
| `width` | number | 输出图像宽度 |
| `height` | number | 输出图像高度 |
| `preserveAspectRatio` | boolean | 保持纵横比 |

## 返回值

`getPhoto()` 返回一个包含以下属性的对象：

```typescript
{
  webPath?: string        // Web 访问路径
  exif?: Exif            // EXIF 数据
  format: string         // 图像格式
  saved?: boolean        // 是否已保存
}
```

## 权限处理

Capacitor 会自动请求所需权限：

- **iOS**: 需要在 `Info.plist` 中配置相机权限
- **Android**: 需要在 `AndroidManifest.xml` 中配置权限

## 错误处理

常见错误场景：

```typescript
try {
  const image = await Camera.getPhoto({...})
} catch (error) {
  if (error.message === 'User cancelled photos app') {
    console.log('用户取消了选择')
  } else if (error.message === 'No Photo selected') {
    console.log('未选择照片')
  } else {
    console.error('相机错误:', error)
  }
}
```

## 高级用法

### 从相册选择

```typescript
const image = await Camera.getPhoto({
  source: CameraSource.Photos,
  resultType: CameraResultType.Uri
})
```

### 获取 Base64 数据

```typescript
const image = await Camera.getPhoto({
  resultType: CameraResultType.Base64
})
const base64String = image.base64String
```

### 调整图像大小

```typescript
const image = await Camera.getPhoto({
  width: 200,
  height: 200,
  preserveAspectRatio: true
})
```

## 存储照片

将照片保存到设备存储：

```typescript
import { Filesystem, Directory } from '@capacitor/filesystem'

async function savePhoto(base64: string) {
  try {
    const fileName = `photo_${Date.now()}.jpg`
    await Filesystem.writeFile({
      path: fileName,
      data: base64,
      directory: Directory.Data
    })
    console.log('照片已保存')
  } catch (error) {
    console.error('保存失败:', error)
  }
}
```

## 下一步

- 查看 [API 参考](/guide/api/index) 了解更多 Capacitor API
- 阅读 [Capacitor Camera 官方文档](https://capacitorjs.com/docs/apis/camera)

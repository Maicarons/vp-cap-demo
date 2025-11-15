<script setup lang="ts">
import { Camera, CameraResultType } from '@capacitor/camera'
import { ref } from 'vue'
import { ElButton, ElImage } from 'element-plus'

const image = ref<string | null>(null)

async function takePhoto() {
  try {
    const photo = await Camera.getPhoto({
      quality: 80,
      resultType: CameraResultType.DataUrl,
    })
    image.value = photo.dataUrl || null
  } catch (err) {
    console.error('Camera error:', err)
  }
}
</script>

<template>
  <div style="text-align: center; padding: 20px;">
    <ElButton
      type="primary"
      @click="takePhoto">
      打开相机
    </ElButton>
    <div v-if="image" style="margin-top: 20px;">
      <ElImage 
        :src="image" 
        style="width: 100%; border-radius: 8px;"
        fit="cover"
        :preview-src-list="[image]"
        preview-teleported
      />
    </div>
  </div>
</template>
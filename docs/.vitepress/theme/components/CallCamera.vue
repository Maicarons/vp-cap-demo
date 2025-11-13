<script setup lang="ts">
import { Camera, CameraResultType } from '@capacitor/camera'
import { ref } from 'vue'

const image = ref<string | null>(null)

async function takePhoto() {
  try {
    const photo = await Camera.getPhoto({
      quality: 80,
      resultType: CameraResultType.DataUrl,
    })
    image.value = photo.dataUrl
  } catch (err) {
    console.error('Camera error:', err)
  }
}
</script>

<template>
  <div style="text-align: center; padding: 20px;">
    <button
      @click="takePhoto"
      style="padding: 10px 20px; border: none; background: #42b983; color: white; border-radius: 6px;"
    >
      打开相机
    </button>
    <div v-if="image" style="margin-top: 20px;">
      <img :src="image" style="width: 100%; border-radius: 8px;" />
    </div>
  </div>
</template>

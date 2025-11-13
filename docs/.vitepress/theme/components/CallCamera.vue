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
    image.value = photo.dataUrl || null
  } catch (err) {
    console.error('Camera error:', err)
  }
}
</script>

<template>
  <div style="text-align: center; padding: 20px;">
    <PrimaryButton
      @click="takePhoto">
      打开相机
    </PrimaryButton>
    <div v-if="image" style="margin-top: 20px;">
      <img :src="image" style="width: 100%; border-radius: 8px;" />
    </div>
  </div>
</template>

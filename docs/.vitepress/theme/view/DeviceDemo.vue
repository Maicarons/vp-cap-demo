<script setup lang="ts">
import { ref } from 'vue'
import { Device } from '@capacitor/device'
import { ElButton, ElCard } from 'element-plus'

const info = ref<any>(null)

async function loadInfo() {
    info.value = await Device.getInfo()
}
</script>

<template>
    <div style="text-align: center; padding: 20px;">
        <ElButton type="primary" @click="loadInfo">Get Device Info</ElButton>
        <ElCard v-if="info" style="margin-top: 20px; text-align: left;">
          <pre>{{ info }}</pre>
        </ElCard>
    </div>
</template>
<script setup lang="ts">
import { ref } from 'vue'
import { Device } from '@capacitor/device'

const info = ref<any>(null)

async function loadInfo() {
    info.value = await Device.getInfo()
}
</script>

<template>
    <div style="text-align: center; padding: 20px;">
        <PrimaryButton @click="loadInfo">Get Device Info</PrimaryButton>
        <pre style="text-align: left;" v-if="info">{{ info }}</pre>
    </div>
</template>

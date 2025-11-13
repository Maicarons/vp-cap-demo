<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { Network } from '@capacitor/network'

const status = ref<any>(null)

async function loadStatus() {
    status.value = await Network.getStatus()
}

let listener: any = null

onMounted(async () => {
    await loadStatus()
    listener = await Network.addListener('networkStatusChange', (s) => {
        status.value = s
    })
})

onUnmounted(() => {
    if (listener) listener.remove()
})
</script>

<template>
    <div style="text-align: center; padding: 20px;">
        <PrimaryButton @click="loadStatus">Refresh Network Status</PrimaryButton>
        <pre style="text-align: left;">{{ status }}</pre>
    </div>
</template>

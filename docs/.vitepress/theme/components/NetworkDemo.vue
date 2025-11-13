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
    <div>
        <button @click="loadStatus">Refresh Network Status</button>
        <pre>{{ status }}</pre>
    </div>
</template>

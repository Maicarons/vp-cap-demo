<script setup lang="ts">
import { ref } from 'vue'
import { Device } from '@capacitor/device'

const info = ref<any>(null)

async function loadInfo() {
    info.value = await Device.getInfo()
}
</script>

<template>
    <div>
        <button @click="loadInfo">Get Device Info</button>
        <pre v-if="info">{{ info }}</pre>
    </div>
</template>

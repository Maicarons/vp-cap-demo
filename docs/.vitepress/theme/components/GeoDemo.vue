<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { Geolocation } from '@capacitor/geolocation'

const pos = ref<any>(null)
const error = ref<string | null>(null)
let listener: any = null
async function getLocation() {
    error.value = null
    try {
        const p = await Geolocation.getCurrentPosition()
        pos.value = p
    } catch (e: any) {
        error.value = e.message
    }
}
</script>

<template>
    <div style="text-align: center; padding: 20px;">
        <PrimaryButton @click="getLocation">Get Current Location</PrimaryButton>

        <pre style="text-align: left;" v-if="pos">{{ pos }}</pre>
        <p v-if="error" style="color:red">{{ error }}</p>
    </div>
</template>

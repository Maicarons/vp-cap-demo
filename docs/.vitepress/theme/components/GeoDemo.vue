<script setup lang="ts">
import { ref } from 'vue'
import { Geolocation } from '@capacitor/geolocation'

const pos = ref<any>(null)
const error = ref<string | null>(null)

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
    <div>
        <button @click="getLocation">Get Current Location</button>

        <pre v-if="pos">{{ pos }}</pre>
        <p v-if="error" style="color:red">{{ error }}</p>
    </div>
</template>

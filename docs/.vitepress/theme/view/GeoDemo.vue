<script setup lang="ts">
import { ref } from 'vue'
import { Geolocation } from '@capacitor/geolocation'
import { ElButton, ElCard, ElAlert } from 'element-plus'

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
    <div style="text-align: center; padding: 20px;">
        <ElButton type="primary" @click="getLocation">Get Current Location</ElButton>

        <ElCard v-if="pos" style="margin-top: 20px; text-align: left;">
          <pre>{{ pos }}</pre>
        </ElCard>
        <ElAlert v-if="error" :title="error" type="error" show-icon style="margin-top: 20px;" />
    </div>
</template>
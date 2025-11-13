<script setup lang="ts">
import { Haptics, ImpactStyle } from '@capacitor/haptics'

async function vibrate() {
    await Haptics.impact({ style: ImpactStyle.Heavy })
}
</script>

<template>
    <div>
        <button @click="vibrate">Trigger Heavy Vibration</button>
    </div>
</template>

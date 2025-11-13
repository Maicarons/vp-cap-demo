<script setup lang="ts">
import { Haptics, ImpactStyle } from '@capacitor/haptics'

async function vibrate() {
    await Haptics.impact({ style: ImpactStyle.Heavy })
}
</script>

<template>
    <div style="text-align: center; padding: 20px;">
        <PrimaryButton @click="vibrate">Trigger Heavy Vibration</PrimaryButton>
    </div>
</template>

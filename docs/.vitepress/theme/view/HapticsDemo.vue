<script setup lang="ts">
import { Haptics, ImpactStyle } from '@capacitor/haptics'
import { ElButton } from 'element-plus'

async function vibrate() {
    await Haptics.impact({ style: ImpactStyle.Heavy })
}
</script>

<template>
    <div style="text-align: center; padding: 20px;">
        <ElButton type="primary" @click="vibrate">Trigger Heavy Vibration</ElButton>
    </div>
</template>
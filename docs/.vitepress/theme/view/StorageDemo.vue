<script setup lang="ts">
import { ref } from 'vue'
import { Preferences } from '@capacitor/preferences'
import { ElInput, ElButton, ElCard } from 'element-plus'

const input = ref('')
const stored = ref<string | null>(null)

async function save() {
    await Preferences.set({
        key: 'demo-text',
        value: input.value,
    })
    await load()
}

async function load() {
    const result = await Preferences.get({ key: 'demo-text' })
    stored.value = result.value
}
</script>

<template>
    <div style="text-align: center; padding: 20px;">
        <ElInput v-model="input" placeholder="Type something..." style="max-width: 300px; margin-bottom: 10px;" />
        <div>
          <ElButton type="primary" @click="save" style="margin: 0 5px;">Save</ElButton>
          <ElButton type="success" @click="load" style="margin: 0 5px;">Load</ElButton>
        </div>

        <ElCard v-if="stored" style="margin-top: 20px;">
          <p>Stored value: {{ stored }}</p>
        </ElCard>
    </div>
</template>
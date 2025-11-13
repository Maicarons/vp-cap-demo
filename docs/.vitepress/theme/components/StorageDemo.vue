<script setup lang="ts">
import { ref } from 'vue'
import { Preferences } from '@capacitor/preferences'

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
        <input v-model="input" placeholder="Type something..." />
        <PrimaryButton @click="save">Save</PrimaryButton>
        <PrimaryButton @click="load">Load</PrimaryButton>

        <p>Stored value: {{ stored }}</p>
    </div>
</template>

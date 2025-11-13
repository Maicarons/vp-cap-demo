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
    <div>
        <input v-model="input" placeholder="Type something..." />
        <button @click="save">Save</button>
        <button @click="load">Load</button>

        <p>Stored value: {{ stored }}</p>
    </div>
</template>

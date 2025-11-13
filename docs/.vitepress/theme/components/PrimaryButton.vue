<template>
    <button class="primary-button" @click="$emit('click')">
        <slot />
    </button>
</template>

<script setup lang="ts">
defineEmits<{
    click: []
}>()
</script>

<style scoped>
.primary-button {
    padding: 10px 20px;
    margin: 0 8px 8px 0;
    border: none;
    background: #7c3aed;
    color: white;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    font-weight: 500;
}

.primary-button:hover {
    background-color: #6d28d9;
}

.primary-button:active {
    background-color: #5b21b6;
}

.primary-button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}

/* 夜间模式 */
:global(.dark) .primary-button {
    background: #8b5cf6;
    color: #f3f4f6;
}

:global(.dark) .primary-button:hover {
    background-color: #7c3aed;
}

:global(.dark) .primary-button:active {
    background-color: #6d28d9;
}

:global(.dark) .primary-button:disabled {
    background-color: #4b5563;
    color: #9ca3af;
}
</style>

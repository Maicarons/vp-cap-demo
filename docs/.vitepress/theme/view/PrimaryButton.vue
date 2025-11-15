<template>
    <el-button 
        type="primary" 
        @click="$emit('click')"
        v-bind="$attrs"
    >
        <slot />
    </el-button>
</template>

<script setup lang="ts">
import { ElButton } from 'element-plus'

defineEmits<{
    click: []
}>()
</script>

<style scoped>
/* 如果需要自定义样式可以在这里添加 */
</style>

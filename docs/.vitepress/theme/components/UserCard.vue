<template>
  <div class="flex items-center p-4 border border-$vp-c-divider rounded-lg bg-white shadow-md">
    <div class="mr-4">
      <img :src="user.avatar || '/default-avatar.png'" :alt="user.name" 
           class="w-15 h-15 rounded-full object-cover" />
    </div>
    <div class="user-details">
      <h3 class="m-0 mb-1 text-lg">{{ user.name }}</h3>
      <p class="m-0 mb-2 text-$vp-c-text-2">{{ user.email }}</p>
      <div class="mt-2 user-actions">
        <slot name="actions"></slot>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
interface User {
  name: string
  email: string
  avatar?: string
}

defineProps<{
  user: User
}>()
</script>

<style scoped>
.user-actions button {
  margin-right: 0.5rem;
}
</style>
<template>
  <nav class="bg-$vp-c-bg-soft p-4 rounded-lg mb-8 flex items-center">
    <button @click="goToUser" 
            class="no-underline text-$vp-c-text-1 px-4 py-2 rounded transition-all duration-300 border-none bg-transparent cursor-pointer text-base hover:bg-$vp-c-brand-1 hover:text-white flex items-center">
      <span class="i-carbon-arrow-left mr-2"></span>
      返回
    </button>
    <div class="flex-1 text-center font-bold text-lg">
      {{ pageTitle }}
    </div>
    <div class="w-20"></div> <!-- 用于平衡布局的空占位元素 -->
  </nav>
</template>

<script setup lang="ts">
import { useRoute, useRouter } from 'vitepress'

const router = useRouter()
const route = useRoute()

// 根据当前路由确定页面标题
const getPageTitle = () => {
  if (route.path === '/user/') {
    return '用户信息'
  } else if (route.path === '/user/settings.html') {
    return '用户设置'
  } else if (route.path === '/user/login.html') {
    return '用户登录'
  } else if (route.path === '/user/signup.html') {
    return '用户注册'
  }
  return '用户中心'
}

const pageTitle = getPageTitle()

const goToUser = () => {
  router.go('/user/')
}
</script>

<style scoped>
</style>
<template>
  <div class="max-w-2xl mx-auto p-8">
    <h1>用户信息</h1>
    <div class="flex flex-col items-center gap-4" v-if="isLoggedIn">
      <div class="mb-5">
        <el-avatar :src="user.avatar || '/default-avatar.png'" :size="100" />
      </div>
      <div class="w-full max-w-100">
        <el-descriptions :column="1" size="large" border>
          <el-descriptions-item label="用户名">{{ user.name }}</el-descriptions-item>
          <el-descriptions-item label="邮箱">{{ user.email }}</el-descriptions-item>
          <el-descriptions-item label="注册时间">{{ user.registerDate }}</el-descriptions-item>
        </el-descriptions>
      </div>
      <el-button type="danger" @click="logout" class="mt-5">退出登录</el-button>
    </div>
    <div class="text-center" v-else>
      <p>请先登录以查看您的个人信息</p>
      <el-button type="primary" @click="goToLogin">立即登录</el-button>
      <el-button type="success" class="ml-2.5" @click="goToSignup">注册账号</el-button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vitepress'
import { 
  ElAvatar, 
  ElButton, 
  ElDescriptions, 
  ElDescriptionsItem 
} from 'element-plus'

const router = useRouter()

interface User {
  name: string
  email: string
  avatar: string
  registerDate: string
}

const isLoggedIn = ref(false)
const user = ref<User>({
  name: '',
  email: '',
  avatar: '',
  registerDate: ''
})

onMounted(() => {
  // 检查是否已登录（模拟）
  const token = localStorage.getItem('user_token')
  if (token) {
    isLoggedIn.value = true
    // 模拟获取用户信息
    user.value = {
      name: '张三',
      email: 'zhangsan@example.com',
      avatar: '',
      registerDate: '2023-01-01'
    }
  }
})

const logout = () => {
  localStorage.removeItem('user_token')
  isLoggedIn.value = false
  user.value = {
    name: '',
    email: '',
    avatar: '',
    registerDate: ''
  }
  router.go('/user/login.html')
}

const goToLogin = (e: Event) => {
  e.preventDefault()
  router.go('/user/login.html')
}

const goToSignup = (e: Event) => {
  e.preventDefault()
  router.go('/user/signup.html')
}
</script>

<style scoped>
</style>
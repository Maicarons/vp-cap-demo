<template>
  <div class="flex justify-center items-center min-h-70vh">
    <div class="w-full max-w-100 p-8 rounded-lg shadow-md bg-$vp-c-bg">
      <h1>用户登录</h1>
      <el-form 
        ref="formRef" 
        :model="formData" 
        :rules="rules" 
        label-position="top"
        @submit.prevent="handleLogin"
      >
        <el-form-item label="邮箱:" prop="email">
          <el-input 
            v-model="formData.email" 
            type="email" 
            placeholder="请输入邮箱地址"
          />
        </el-form-item>
        
        <el-form-item label="密码:" prop="password">
          <el-input 
            v-model="formData.password" 
            type="password" 
            placeholder="请输入密码"
            show-password
          />
        </el-form-item>
        
        <el-alert 
          v-if="error" 
          :title="error" 
          type="error" 
          show-icon 
          class="mb-5"
        />
        
        <el-form-item>
          <el-button 
            type="primary" 
            native-type="submit" 
            :loading="loading"
            class="w-full"
          >
            登录
          </el-button>
        </el-form-item>
      </el-form>
      
      <div class="flex justify-between mt-4">
        <el-button type="success" link @click="goToSignup">还没有账号？立即注册</el-button>
        <el-button type="primary" link @click="goToSettings" class="forgot-password">忘记密码？</el-button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'
import { useRouter } from 'vitepress'
import { 
  ElForm, 
  ElFormItem, 
  ElInput, 
  ElButton, 
  ElAlert 
} from 'element-plus'

const router = useRouter()
const formRef = ref()
const loading = ref(false)

const formData = reactive({
  email: '',
  password: ''
})

const rules = {
  email: [
    { required: true, message: '请输入邮箱地址', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, message: '密码长度至少为6位', trigger: 'blur' }
  ]
}

const error = ref('')

const handleLogin = async () => {
  if (!formRef.value) return
  
  await formRef.value.validate((valid: boolean) => {
    if (valid) {
      login()
    }
  })
}

const login = () => {
  loading.value = true
  error.value = ''
  
  // 模拟登录过程
  setTimeout(() => {
    try {
      // 这里应该调用实际的API进行登录验证
      // 模拟登录成功
      localStorage.setItem('user_token', 'fake-jwt-token')
      
      // 跳转到用户主页
      router.go('/user/')
    } catch (err) {
      error.value = '登录失败，请检查邮箱和密码'
    } finally {
      loading.value = false
    }
  }, 1000)
}

const goToSignup = (e: Event) => {
  e.preventDefault()
  router.go('/user/signup.html')
}

const goToSettings = (e: Event) => {
  e.preventDefault()
  router.go('/user/settings.html')
}
</script>

<style scoped>
</style>
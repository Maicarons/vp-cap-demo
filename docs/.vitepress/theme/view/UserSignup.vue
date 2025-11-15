<template>
  <div class="flex justify-center items-center min-h-70vh">
    <div class="w-full max-w-100 p-8 rounded-lg shadow-md bg-$vp-c-bg">
      <h1>用户注册</h1>
      <el-form 
        ref="formRef" 
        :model="formData" 
        :rules="rules" 
        label-position="top"
        @submit.prevent="handleSignup"
      >
        <el-form-item label="用户名:" prop="username">
          <el-input 
            v-model="formData.username" 
            placeholder="请输入用户名"
          />
        </el-form-item>
        
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
        
        <el-form-item label="确认密码:" prop="confirmPassword">
          <el-input 
            v-model="formData.confirmPassword" 
            type="password" 
            placeholder="请再次输入密码"
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
            type="success" 
            native-type="submit" 
            :loading="loading"
            class="w-full"
          >
            注册
          </el-button>
        </el-form-item>
      </el-form>
      
      <div class="flex justify-center mt-4">
        <el-button type="primary" link @click="goToLogin">已有账号？立即登录</el-button>
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
  username: '',
  email: '',
  password: '',
  confirmPassword: ''
})

const validatePass = (rule: any, value: string, callback: any) => {
  if (value === '') {
    callback(new Error('请输入密码'))
  } else {
    if (formData.confirmPassword !== '') {
      if (formRef.value) {
        formRef.value.validateField('confirmPassword')
      }
    }
    callback()
  }
}

const validatePass2 = (rule: any, value: string, callback: any) => {
  if (value === '') {
    callback(new Error('请再次输入密码'))
  } else if (value !== formData.password) {
    callback(new Error('两次输入的密码不一致!'))
  } else {
    callback()
  }
}

const rules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱地址', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
  ],
  password: [
    { required: true, validator: validatePass, trigger: 'blur' },
    { min: 6, message: '密码长度至少为6位', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, validator: validatePass2, trigger: 'blur' }
  ]
}

const error = ref('')

const handleSignup = async () => {
  if (!formRef.value) return
  
  await formRef.value.validate((valid: boolean) => {
    if (valid) {
      signup()
    }
  })
}

const signup = () => {
  loading.value = true
  error.value = ''
  
  // 模拟注册过程
  setTimeout(() => {
    try {
      // 这里应该调用实际的API进行注册
      // 模拟注册成功
      localStorage.setItem('user_token', 'fake-jwt-token')
      
      // 跳转到用户主页
      router.go('/user/')
    } catch (err) {
      error.value = '注册失败，请稍后再试'
    } finally {
      loading.value = false
    }
  }, 1000)
}

const goToLogin = (e: Event) => {
  e.preventDefault()
  router.go('/user/login.html')
}
</script>

<style scoped>
</style>
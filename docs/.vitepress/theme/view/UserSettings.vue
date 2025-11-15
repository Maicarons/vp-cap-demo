<template>
  <div class="max-w-800px mx-auto p-8">
    <h1 class="text-xl font-bold mb-6">用户设置</h1>
    
    <div class="p-8 rounded-lg shadow-sm bg-[var(--vp-c-bg)]" v-if="isLoggedIn">
      <el-form 
        ref="formRef" 
        :model="settings" 
        label-position="top"
        require-asterisk-position="right"
      >
        <el-form-item label="用户名:">
          <el-input 
            v-model="settings.username" 
            placeholder="请输入用户名"
          />
        </el-form-item>
        
        <el-form-item label="邮箱:">
          <el-input 
            v-model="settings.email" 
            type="email"
            placeholder="请输入邮箱地址"
          />
        </el-form-item>
        
        <el-form-item label="头像:">
          <el-input 
            v-model="settings.avatar" 
            placeholder="请输入头像链接"
          />
          <div v-if="settings.avatar" class="mt-2">
            <el-avatar :src="settings.avatar" :size="60" />
          </div>
        </el-form-item>
        
        <el-form-item>
          <el-checkbox v-model="settings.notifications">
            启用通知
          </el-checkbox>
        </el-form-item>
        
        <el-form-item>
          <el-checkbox v-model="settings.darkMode">
            深色模式
          </el-checkbox>
        </el-form-item>
        
        <el-alert 
          v-if="saveMessage && !isError" 
          :title="saveMessage" 
          type="success" 
          show-icon 
          closable
          class="mb-5"
        />
        
        <el-alert 
          v-if="saveMessage && isError" 
          :title="saveMessage" 
          type="error" 
          show-icon 
          closable
          class="mb-5"
        />
        
        <el-form-item>
          <el-button 
            type="primary" 
            @click="saveSettings"
            :loading="saving"
          >
            保存设置
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    
    <div class="text-center p-8" v-else>
      <p class="mb-4">请先登录以修改设置</p>
      <el-button type="primary" @click="goToLogin">立即登录</el-button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { useRouter } from 'vitepress'
import { 
  ElForm, 
  ElFormItem, 
  ElInput, 
  ElButton, 
  ElCheckbox, 
  ElAlert, 
  ElAvatar 
} from 'element-plus'

const router = useRouter()
const formRef = ref()

interface Settings {
  username: string
  email: string
  avatar: string
  notifications: boolean
  darkMode: boolean
}

const isLoggedIn = ref(false)
const saveMessage = ref('')
const isError = ref(false)
const saving = ref(false)

const settings = reactive<Settings>({
  username: '',
  email: '',
  avatar: '',
  notifications: true,
  darkMode: false
})

onMounted(() => {
  // 检查是否已登录
  const token = localStorage.getItem('user_token')
  if (token) {
    isLoggedIn.value = true
    // 模拟加载用户设置
    loadSettings()
  }
})

const loadSettings = () => {
  // 模拟从localStorage加载设置
  const savedSettings = localStorage.getItem('user_settings')
  if (savedSettings) {
    Object.assign(settings, JSON.parse(savedSettings))
  } else {
    // 默认设置
    Object.assign(settings, {
      username: '张三',
      email: 'zhangsan@example.com',
      avatar: '',
      notifications: true,
      darkMode: false
    })
  }
}

const saveSettings = () => {
  saving.value = true
  saveMessage.value = ''
  
  try {
    // 模拟保存设置
    localStorage.setItem('user_settings', JSON.stringify(settings))
    saveMessage.value = '设置已保存'
    isError.value = false
  } catch (err) {
    saveMessage.value = '保存失败，请稍后再试'
    isError.value = true
  } finally {
    saving.value = false
    // 3秒后清除消息
    setTimeout(() => {
      saveMessage.value = ''
    }, 3000)
  }
}

const goToLogin = (e: Event) => {
  e.preventDefault()
  router.go('/user/login.html')
}
</script>
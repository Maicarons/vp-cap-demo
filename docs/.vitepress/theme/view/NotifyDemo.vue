<template>
    <div style="text-align: center; padding: 20px;">
        <h3>🔔 Local Notification Demo</h3>
        <ElButton type="primary" @click="requestPermission">Request Permission</ElButton>
        <ElButton type="success" @click="sendNotification">Send Notification</ElButton>
    </div>
</template>

<script setup lang="ts">
import { LocalNotifications } from '@capacitor/local-notifications';
import { ElButton, ElMessage } from 'element-plus';

async function requestPermission() {
    const result = await LocalNotifications.requestPermissions();
    console.log('Permission result:', result);
    ElMessage({
      message: 'Permission: ' + result.display,
      type: result.display === 'granted' ? 'success' : 'warning'
    });
}

async function sendNotification() {
    await LocalNotifications.schedule({
        notifications: [
            {
                title: 'Hello from VitePress!',
                body: 'This is a local notification from your app 🚀',
                id: Date.now(),
                schedule: { at: new Date(Date.now() + 2000) }, // 延迟2秒发送
                sound: undefined,
                smallIcon: 'ic_launcher', // 默认图标
            },
        ],
    });
    ElMessage.success('Notification scheduled!');
}
</script>
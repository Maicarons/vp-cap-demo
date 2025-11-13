<template>
    <div style="text-align: center; padding: 20px;">
        <h3>🔔 Local Notification Demo</h3>
        <PrimaryButton @click="requestPermission">Request Permission</PrimaryButton>
        <PrimaryButton @click="sendNotification">Send Notification</PrimaryButton>
    </div>
</template>

<script setup lang="ts">
import { LocalNotifications } from '@capacitor/local-notifications';

async function requestPermission() {
    const result = await LocalNotifications.requestPermissions();
    console.log('Permission result:', result);
    alert('Permission: ' + result.display);
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
    alert('Notification scheduled!');
}
</script>

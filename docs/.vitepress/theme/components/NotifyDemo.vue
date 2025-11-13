<template>
    <div style="padding: 16px">
        <h3>🔔 Local Notification Demo</h3>
        <button @click="requestPermission">Request Permission</button>
        <button @click="sendNotification">Send Notification</button>
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

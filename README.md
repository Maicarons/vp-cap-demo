# VP Cap Demo

A VitePress documentation site integrated with Capacitor for mobile app capabilities.

## Features

- 📱 VitePress documentation framework
- 📷 Capacitor Camera integration
- 🎯 Vue 3 components
- 🤖 Android APK build support

## Project Structure

```
vp-cap-demo/
├─ docs/
│  ├─ index.md                    # Main documentation
│  └─ .vitepress/
│     ├─ config.ts                # VitePress configuration
│     └─ theme/
│        ├─ index.ts              # Theme configuration
│        └─ components/
│           └─ CallCamera.vue     # Camera component
├─ android/                       # Android project
├─ package.json
├─ capacitor.config.ts
├─ vite.config.ts
└─ build-apk.sh                  # APK build script
```

## Getting Started

### Prerequisites

- Node.js (v18+)
- Bun package manager
- Java Development Kit (JDK 17+)
- Android SDK

### Installation

```bash
# Install dependencies
bun install

# Install VitePress, Vue, and Capacitor packages
bun add vitepress vue @capacitor/core @capacitor/cli @capacitor/android @capacitor/camera
```

### Development

```bash
# Run documentation in development mode
bun run docs:dev
```

### Building

```bash
# Build documentation
bun run docs:build

# Build APK (requires Android SDK setup)
./build-apk.sh
```

## Capacitor Setup

Initialize Capacitor (if not already done):

```bash
bunx cap init
```

Add Android platform:

```bash
bunx cap add android
```

## Camera Component

The `CallCamera.vue` component provides photo capture functionality using Capacitor's Camera API.

### Usage

```vue
<template>
  <CallCamera />
</template>

<script setup>
import CallCamera from './components/CallCamera.vue'
</script>
```

## Build APK

Run the build script to generate an Android APK:

```bash
./build-apk.sh
```

The script will:
1. Build the VitePress documentation
2. Prepare Capacitor assets
3. Build the Android APK using Gradle

## Dependencies

- **vitepress**: Documentation framework
- **vue**: Progressive JavaScript framework
- **@capacitor/core**: Capacitor core library
- **@capacitor/cli**: Capacitor CLI tools
- **@capacitor/android**: Android platform support
- **@capacitor/camera**: Camera plugin

## License

MIT

## Support

For issues and questions, please check the documentation or create an issue in the repository.

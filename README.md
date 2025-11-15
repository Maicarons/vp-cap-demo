# VP Cap Demo

A VitePress documentation site integrated with Capacitor for mobile app capabilities.

```bash
bun run full:build
$ bun run sync && bun run apk:build
$ vitepress build docs && bun x cap copy && bunx cap sync
Debugger attached.

  vitepress v2.0.0-alpha.13

✓ building client + server bundles...
✓ rendering pages...
build complete in 9.87s.
Waiting for the debugger to disconnect...
Debugger attached.
✔ Copying web assets from dist to android/app/src/main/assets/public in 108.91ms
✔ Creating capacitor.config.json in android/app/src/main/assets in 2.80ms
✔ copy android in 159.27ms
✔ copy web in 18.88ms
Waiting for the debugger to disconnect...
Debugger attached.
✔ Copying web assets from dist to android/app/src/main/assets/public in 66.64ms
✔ Creating capacitor.config.json in android/app/src/main/assets in 1.18ms
✔ copy android in 114.10ms
✔ Updating Android plugins in 3.21ms
[info] Found 7 Capacitor plugins for android:
       @capacitor/camera@7.0.2
       @capacitor/device@7.0.2
       @capacitor/geolocation@7.1.5
       @capacitor/haptics@7.0.2
       @capacitor/local-notifications@7.0.3
       @capacitor/network@7.0.2
       @capacitor/preferences@7.0.2
✔ update android in 122.11ms
✔ copy web in 11.90ms
✔ update web in 14.37ms
[info] Sync finished in 0.322s
Waiting for the debugger to disconnect...
$ cd android && ./gradlew assembleDebug && cd ..

> Configure project :app


> Configure project :capacitor-cordova-android-plugins


BUILD SUCCESSFUL in 4s
276 actionable tasks: 25 executed, 251 up-to-date
```

## Features

- 📱 VitePress documentation framework
- 📷 Capacitor Camera integration and more
- 🎯 Vue 3 components
- 🤖 Android APK build support and more

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
│           ├─ CallCamera.vue     # Camera component
│           └─ more...
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
# or ./build-apk-local.sh if you have full environments
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
- more...

## License

MIT

## Support

For issues and questions, please check the documentation or create an issue in the repository.

## Why

1. Why vitepress?

no why

2. Why 

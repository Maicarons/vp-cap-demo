#!/usr/bin/env bash
set -e

echo "🔍 [1/9] Checking Node.js and npm..."
if ! command -v node &> /dev/null; then
  echo "❌ Node.js not found. Installing..."
  curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi
echo "✅ Node.js: $(node -v)"
echo "✅ npm: $(npm -v)"

echo "🔍 [2/9] Checking Bun..."
if ! command -v bun &> /dev/null; then
  echo "❌ Bun not found. Installing..."
  curl -fsSL https://bun.sh/install | bash
  export PATH="$HOME/.bun/bin:$PATH"
fi
echo "✅ Bun: $(bun --version)"

echo "🔍 [3/9] Checking Java..."
if ! command -v java &> /dev/null; then
  echo "❌ Java not found. Installing OpenJDK 17..."
  sudo apt-get update -y
  sudo apt-get install -y openjdk-17-jdk
fi
echo "✅ Java: $(java -version 2>&1 | head -n 1)"

echo "🔍 [4/9] Checking Android SDK..."
ANDROID_SDK_ROOT="$HOME/android-sdk"
if [ ! -d "$ANDROID_SDK_ROOT" ]; then
  echo "❌ Android SDK not found. Installing..."
  mkdir -p "$ANDROID_SDK_ROOT"
  cd "$ANDROID_SDK_ROOT"
  curl -s https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -o cmdline-tools.zip
  unzip -q cmdline-tools.zip -d cmdline-tools
  rm cmdline-tools.zip
  export PATH="$ANDROID_SDK_ROOT/cmdline-tools/bin:$PATH"
  yes | $ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager --licenses
  yes | $ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"
fi
export ANDROID_SDK_ROOT="$HOME/android-sdk"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/build-tools/35.0.0:$PATH"
echo "✅ Android SDK ready"

echo "🔍 [5/9] Checking Gradle..."
if ! command -v gradle &> /dev/null; then
  echo "❌ Gradle not found. Installing..."
  sudo apt-get install -y gradle
fi
echo "✅ Gradle: $(gradle -v | grep Gradle)"

echo "🔍 [6/9] Installing project dependencies..."
bun install || npm install

echo "🔍 [7/9] Initializing Capacitor..."
if [ ! -f "capacitor.config.ts" ] && [ ! -f "capacitor.config.json" ]; then
  npx cap init vp-cap-demo com.example.vpcapdemo --web-dir=dist --yes
fi
npm install @capacitor/core @capacitor/cli --save
npx cap add android || true

echo "🔍 [8/9] Building VitePress site..."
bunx vitepress build docs

echo "🔍 [9/9] Syncing and building APK..."
npx cap sync android
cd android
./gradlew assembleDebug

APK_PATH=$(find app/build/outputs/apk/debug -name "*.apk" | head -n 1)
echo "🎉 APK build complete!"
echo "📦 Path: $APK_PATH"

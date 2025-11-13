#!/usr/bin/env bash
set -e

echo "🔍 Checking environment..."

# ========== 检查 Java ==========
if ! command -v java &>/dev/null; then
  echo "☕ Installing OpenJDK 17..."
  sudo apt update
  sudo apt install -y openjdk-17-jdk
else
  echo "☕ Java found: $(java -version 2>&1 | head -n 1)"
fi

# ========== 检查 Gradle ==========
if ! command -v gradle &>/dev/null; then
  echo "📦 Installing Gradle..."
  sudo apt install -y gradle
else
  echo "📦 Gradle found: $(gradle -v | head -n 1)"
fi

# ========== 检查 Android SDK ==========
ANDROID_HOME="$HOME/android-sdk"
if [ ! -d "$ANDROID_HOME" ]; then
  echo "📱 Installing Android SDK..."
  sudo apt install -y unzip wget
  mkdir -p "$ANDROID_HOME/cmdline-tools"
  cd "$ANDROID_HOME/cmdline-tools"
  wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip
  unzip tools.zip -d latest
  rm tools.zip
  export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
  yes | sdkmanager --licenses
  sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"
else
  echo "📱 Android SDK found at $ANDROID_HOME"
  export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
fi

# ========== 检查 Capacitor Android 工程 ==========
if [ ! -d "android" ]; then
  echo "⚙️ Initializing Capacitor Android project..."
  bunx cap add android
else
  echo "⚙️ Android project found."
fi

# ========== 同步 VitePress 资源 ==========
echo "📦 Syncing web build to Android..."
bun run docs:build
bunx cap sync android

# ========== 构建 APK ==========
echo "🚀 Building APK..."
cd android
./gradlew assembleDebug

# ========== 输出 APK 路径 ==========
APK_PATH=$(find ./app/build/outputs/apk/debug -name "*.apk" | head -n 1)
if [ -f "$APK_PATH" ]; then
  echo "✅ APK built successfully:"
  echo "   $APK_PATH"
else
  echo "❌ APK build failed."
  exit 1
fi

#!/usr/bin/env bash
set -e

echo "🔍 [0/9] Save current directory as project root..."
PROJECT_ROOT=$(pwd)

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
  echo "❌ Java not found. Installing OpenJDK 21..."
  sudo apt-get update -y
  sudo apt-get install -y openjdk-21-jdk
fi
echo "✅ Java: $(java -version 2>&1 | head -n 1)"

echo "🔍 [4/9] Checking Android SDK..."
# ANDROID_HOME="$HOME/android-sdk"
# if [ ! -d "$ANDROID_HOME" ]; then
#   echo "❌ Android SDK not found. Installing..."
#   mkdir -p "$ANDROID_HOME/cmdline-tools"
#   cd "$ANDROID_HOME/cmdline-tools"
#   curl -s https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -o cmdline-tools.zip
#   unzip -q cmdline-tools.zip
#   rm cmdline-tools.zip

#   if [ -d "cmdline-tools" ]; then
#     mv cmdline-tools latest
#   fi

#   export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

#   yes | "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" --licenses
#   yes | "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" "platform-tools" "platforms;android-35" "build-tools;35.0.0"
# fi

# export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/35.0.0:$PATH"
# export ANDROID_HOME
# unset ANDROID_SDK_ROOT

echo "✅ Android SDK ready"

echo "🔍 [5/9] Checking Gradle..."
if ! command -v gradle &> /dev/null; then
  echo "❌ Gradle not found. Installing..."
  sudo apt-get install -y gradle
fi
echo "✅ Gradle: $(gradle -v | grep Gradle)"

echo "🔍 [6/9] Installing project dependencies..."
cd "$PROJECT_ROOT"
bun install

echo "🔍 [7/9] Initializing Capacitor..."
cd "$PROJECT_ROOT"
# if [ ! -f "capacitor.config.ts" ] && [ ! -f "capacitor.config.json" ]; then
#   npx cap init vp-cap-demo com.example.vpcapdemo --web-dir=dist --yes
# fi
# bun install @capacitor/core @capacitor/cli --save
# bunx cap add android || true

echo "🔍 [8/9] Building VitePress site..."
cd "$PROJECT_ROOT"
bunx vitepress build docs

echo "🔍 [9/9] Syncing and building APK..."
cd "$PROJECT_ROOT"
bunx cap sync android
cd android
./gradlew assembleDebug

APK_PATH=$(find app/build/outputs/apk/debug -name "*.apk" | head -n 1)
echo "🎉 APK build complete!"
echo "📦 Path: $APK_PATH"

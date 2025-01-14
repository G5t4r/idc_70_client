#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_ROOT="$DIR/.."
APP_ANDROID_ROOT="$DIR"
if [ -d "/cygdrive/" ]; then
    ANDROID_NDK_ROOT=`cygpath "$ANDROID_NDK_ROOT"`
    QUICK_COCOS2DX_ROOT=`cygpath "$QUICK_COCOS2DX_ROOT"`
    COCOS2DX_ROOT=`cygpath "$COCOS2DX_ROOT"`
fi

echo "- config:"
echo "  ANDROID_NDK_ROOT    = $ANDROID_NDK_ROOT"
echo "  QUICK_COCOS2DX_ROOT = $QUICK_COCOS2DX_ROOT"
echo "  COCOS2DX_ROOT       = $COCOS2DX_ROOT"
echo "  APP_ROOT            = $APP_ROOT"
echo "  APP_ANDROID_ROOT    = $APP_ANDROID_ROOT"

echo "- cleanup"
find "$APP_ANDROID_ROOT" -type d | xargs chmod 755 $1
if [ -d "$APP_ANDROID_ROOT"/bin ]; then
    rm -rf "$APP_ANDROID_ROOT"/bin/*.apk
fi
mkdir -p "$APP_ANDROID_ROOT"/bin
chmod 755 "$APP_ANDROID_ROOT"/bin

#if [ -d "$APP_ANDROID_ROOT"/assets ]; then
#    rm -rf "$APP_ANDROID_ROOT"/assets/*
#fi
#mkdir -p "$APP_ANDROID_ROOT"/assets
#chmod 755 "$APP_ANDROID_ROOT"/assets

#echo "- copy scripts"
#cp -rf "$APP_ROOT"/resource/scripts "$APP_ANDROID_ROOT"/assets/
#echo "- copy resources"
#cp -rf "$APP_ROOT"/resource/res "$APP_ANDROID_ROOT"/assets/

# build
echo "Using prebuilt externals"
NDK_MODULE_PATH="${QUICK_COCOS2DX_ROOT}:${QUICK_COCOS2DX_ROOT}/lib/qtz_component:${QUICK_COCOS2DX_ROOT}/lib/cocos2d-x:${QUICK_COCOS2DX_ROOT}/lib/cocos2d-x/cocos2dx/platform/third_party/android/prebuilt"
#NDK_MODULE_PATH="${QUICK_COCOS2DX_ROOT}:${COCOS2DX_ROOT}:${COCOS2DX_ROOT}/cocos2dx/platform/third_party/android/prebuilt"
echo "${NDK_MODULE_PATH}"
"$ANDROID_NDK_ROOT"/ndk-build $ANDROID_NDK_BUILD_FLAGS -C "$APP_ANDROID_ROOT" $* "NDK_MODULE_PATH=${NDK_MODULE_PATH}"

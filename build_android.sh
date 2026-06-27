if [ -z "${ANDROID_NDK_HOME}" ]; then
    echo "Error: ANDROID_NDK_HOME is not set." >&2
    echo "    Try $HOME/Android/Sdk/ndk/" >&2
    exit 1
fi

echo "Running cmake ..."
cmake -S . -B build_arm64 \
    --toolchain "${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" \
    -DANDROID_PLATFORM=29 \
    -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a \
    -DCMAKE_ANDROID_STL_TYPE=c++_static \
    -DANDROID_USE_LEGACY_TOOLCHAIN_FILE=NO \
    -DCMAKE_BUILD_TYPE=Release \
    -DUPDATE_DEPS=ON \
    -G"Ninja"

echo "Building build_arm64 ..."
cmake --build build_arm64

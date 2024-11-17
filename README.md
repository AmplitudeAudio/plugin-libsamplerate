# plugin-libsamplerate

An official Amplitude Audio plugin, offering a [Resampler](https://docs.amplitudeaudiosdk.com/nightly/api/dsp/Resampler) implementation using [libsamplerate](http://libsndfile.github.io/libsamplerate/).

## How to build

This plugin uses [CMake](https://cmake.org) and [vcpkg](https://vcpkg.io). You may need to install them first before to build.

Configure the CMake project by giving the path to your Amplitude Audio SDK installation:

```bash
$ cmake -DCMAKE_TOOLCHAIN_FILE:STRING=/path/to/vcpkg/scripts/buildsystems/vcpkg.cmake -DAM_SDK_PATH:STRING=/path/to/sdk --no-warn-unused-cli -S/path/to/plugin-libsamplerate -B/path/to/plugin-libsamplerate/build -G Ninja
```

> Note: We recommend to use Ninja as the generator, but you can use the one you wish.

Once configured, you can build the project using:

```bash
$ cmake --build /path/to/plugin-libsamplerate/build --target all
```

Then, you can install the plugin in the SDK folder with:

```bash
$ cmake --build /path/to/plugin-libsamplerate/build --target install
```

## How to use

You should use the plugin canonical name (the same name as the CMake project) when loading the plugin through the engine:

```cpp
// Release builds
Engine::LoadPlugin(AM_OS_STRING("AmplitudeLibsamplerateResamplerPlugin"));

// Debug builds
Engine::LoadPlugin(AM_OS_STRING("AmplitudeLibsamplerateResamplerPlugin_d"));
```

## License

Licensed under the [Apache License 2.0](https://github.com/AmplitudeAudio/plugin-flac/blob/main/LICENSE).

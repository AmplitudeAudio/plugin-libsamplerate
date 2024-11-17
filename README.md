# Amplitude Audio Plugin Template

This template repository provides the basics to start a new plugin project for Amplitude Audio. The template uses C++ and [CMake](https://cmake.org) for development, and [vcpkg](https://vcpkg.io) for package management. You may need to install them first.

## Get started

Search for `TODO` comments in template files and follow the instructions. You will also need to update the vcpkg manifest file (`vcpkg.json`) with your plugin details (name, description, version, etc.).

## How to build

Configure the CMake project by giving the path to your Amplitude Audio SDK installation:

```bash
$ cmake -DCMAKE_TOOLCHAIN_FILE:STRING=/path/to/vcpkg/scripts/buildsystems/vcpkg.cmake -DAM_SDK_PATH:STRING=/path/to/sdk --no-warn-unused-cli -S/path/to/my-plugin -B/path/to/my-plugin/build -G Ninja
```

> Note: We recommend to use Ninja as the generator, but you can use the one you wish.

Once configured, you can build the project using:

```bash
$ cmake --build /path/to/my-plugin/build --target all
```

Then, you can install the plugin in the SDK folder with:

```bash
$ cmake --build /path/to/my-plugin/build --target install
```

## How to use

You should use the plugin canonical name (the same name as the CMake project) when loading the plugin through the engine:

```cpp
// Release builds
Engine::LoadPlugin(AM_OS_STRING("PluginIdentifier"));

// Debug builds
Engine::LoadPlugin(AM_OS_STRING("PluginIdentifier_d"));
```

## License

This template is licensed under the [Apache License 2.0](https://github.com/AmplitudeAudio/plugin-flac/blob/main/LICENSE). You have the right to change the licensing for your custom plugin.
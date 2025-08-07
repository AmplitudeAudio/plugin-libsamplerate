-- Copyright (c) 2025-present Sparky Studios. All rights reserved.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- Project definition
set_project("LibsamplerateResampler")
set_version("0.1.0")
set_license("Apache-2.0")
set_languages("c++20")
set_description("The official Amplitude plugin for resampling audio using libsamplerate.")
set_xmakever("3.0.0")

add_rules("mode.debug", "mode.release", "mode.coverage")
add_rules("plugin.compile_commands.autoupdate")

-- Options
option("as_package")
  set_default(false)
  set_showmenu(true)
  set_description("Configure as a package. This is useful when using Amplitude from sources instead of SDK installation.")
option_end()

-- Dependencies
add_requires("amplitudeaudiosdk >= 1.0.0")
add_requires("libsamplerate")

target("LibsamplerateResampler")
  set_kind("shared")
  set_default(true)
  set_basename("AmplitudeLibsamplerateResampler")

  if is_mode("debug") then
    set_suffixname("_d")
  end

  if not has_config("as_package") then
    set_prefixdir("/", { libdir = "lib/shared/$(arch)-$(plat)", bindir = "lib/shared/$(arch)-$(plat)" })
  end

  add_packages("amplitudeaudiosdk", "libsamplerate")

  -- Include paths
  add_includedirs("$(projectdir)", { public = false })
  add_includedirs("$(projectdir)/src", { public = false })

  add_defines("AM_BUILDSYSTEM_BUILDING_PLUGIN", { public = false })

  add_files("src/**.cpp")
  add_files("Plugin.cpp")

  -- INSTALLATION
  -- ----------------------------------------

  add_headerfiles("$(projectdir)/include/(**.h)")
target_end()

// Copyright (c) 2024-present Sparky Studios. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <Plugin.h>

AM_API_PRIVATE Engine* s_engine = nullptr;
AM_API_PRIVATE MemoryManager* s_memoryManager = nullptr;

extern "C" {

AM_API_PLUGIN const char* PluginName()
{
    return "My plugin name";
}

AM_API_PLUGIN const char* PluginVersion()
{
    return "0.1.0";
}

AM_API_PLUGIN const char* PluginDescription()
{
    return "My plugin description";
}

AM_API_PLUGIN const char* PluginAuthor()
{
    return "My company name";
}

AM_API_PLUGIN const char* PluginCopyright()
{
    return "Copyright (c) My company name. All rights Reserved.";
}

AM_API_PLUGIN const char* PluginLicense()
{
    return "Apache License, Version 2.0";
}

AM_API_PLUGIN bool RegisterPlugin(Engine* engine, MemoryManager* memoryManager)
{
    s_engine = engine;
    s_memoryManager = memoryManager;

    // TODO: Initialize your plugin here

    return true;
}

AM_API_PLUGIN bool UnregisterPlugin()
{
    // TODO: Clean up your plugin here

    s_engine = nullptr;
    s_memoryManager = nullptr;

    return true;
}

} // extern "C"
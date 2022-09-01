#include "include/metadata_god/metadata_god_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "metadata_god_plugin.h"

void MetadataGodPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  metadata_god::MetadataGodPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

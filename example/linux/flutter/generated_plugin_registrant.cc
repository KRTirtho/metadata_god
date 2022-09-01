//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <metadata_god/metadata_god_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) metadata_god_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MetadataGodPlugin");
  metadata_god_plugin_register_with_registrar(metadata_god_registrar);
}

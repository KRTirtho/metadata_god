#ifndef FLUTTER_PLUGIN_metadata_god_PLUGIN_H_
#define FLUTTER_PLUGIN_metadata_god_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace metadata_god {

class MetadataGodPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MetadataGodPlugin();

  virtual ~MetadataGodPlugin();

  // Disallow copy and assign.
  MetadataGodPlugin(const MetadataGodPlugin&) = delete;
  MetadataGodPlugin& operator=(const MetadataGodPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace metadata_god

#endif  // FLUTTER_PLUGIN_metadata_god_PLUGIN_H_

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'metadata_god_method_channel.dart';

abstract class MetadataGodPlatform extends PlatformInterface {
  MetadataGodPlatform() : super(token: _token);

  static final Object _token = Object();

  static MetadataGodPlatform _instance = MethodChannelMetadataGod();

  /// The default instance of [MetadataGodPlatform] to use.
  ///
  /// Defaults to [MethodChannelMetadataGod].
  static MetadataGodPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MetadataGodPlatform] when
  /// they register themselves.
  static set instance(MetadataGodPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

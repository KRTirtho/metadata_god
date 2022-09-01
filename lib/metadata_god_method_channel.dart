import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'metadata_god_platform_interface.dart';

/// An implementation of [MetadataGodPlatform] that uses method channels.
class MethodChannelMetadataGod extends MetadataGodPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('metadata_god');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

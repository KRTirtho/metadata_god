import 'dart:io';

import 'package:metadata_god/src/ffi.dart';
export 'package:metadata_god/src/bridge_generated.dart' show Metadata, Image;

class MetadataGod {
  static registerWith([dynamic _]) {}

  static Future<Metadata?> getMetadata(File file) async {
    if (!await file.exists()) return null;
    return await api.readMetadata(file: file.path);
  }

  static Future<void> writeMetadata(File file, Metadata metadata) async {
    if (!await file.exists()) return;
    return await api.writeMetadata(file: file.path, metadata: metadata);
  }

  static Future<String> ping() async {
    return await api.ping();
  }
}

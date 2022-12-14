import 'dart:io';

import 'package:metadata_god/src/ffi.dart' hide Metadata, Image;
import 'package:metadata_god/src/models/metadata.dart';
import 'package:metadata_god/src/extensions/native_metadata.dart';

class MetadataGod {
  static registerWith([dynamic _]) {}

  /// Extracts metadata from a audio file and returns a [Metadata] object
  static Future<Metadata?> getMetadata(String path) async {
    final file = File(path);
    if (!await file.exists()) return null;
    return (await api.readMetadata(file: file.path)).toMetadata();
  }

  /// Writes audio-tags or audio metadata to a supported audio file formate
  static Future<void> writeMetadata(String path, Metadata metadata) async {
    final file = File(path);
    if (!await file.exists()) return;
    return await api.writeMetadata(
      file: file.path,
      metadata: MetadataConversion.fromMetadata(metadata),
    );
  }

  static Future<String> ping() async {
    return await api.ping();
  }
}

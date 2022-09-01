import 'dart:io';

import 'package:metadata_god/ffi.dart';

class MetadataGod {
  static Future<Metadata?> getMetadata(File file) async {
    if (!await file.exists()) return null;
    return await api.buildMetadata(file: file.path);
  }
}

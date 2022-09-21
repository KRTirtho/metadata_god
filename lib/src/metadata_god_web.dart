import 'package:metadata_god/src/models/metadata.dart';

class MetadataGod {
  static registerWith([dynamic _]) {}

  static Future<Metadata?> getMetadata(String file) async {
    return null;
  }

  static Future<void> writeMetadata(String file, Metadata metadata) async {}

  static Future<String> ping() async {
    return "ping";
  }
}

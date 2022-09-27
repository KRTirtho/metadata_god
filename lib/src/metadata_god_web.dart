import 'package:metadata_god/src/models/metadata.dart';

class MetadataGod {
  static registerWith([dynamic _]) {}

  static Future<Metadata?> getMetadata(String file) async {
    throw UnimplementedError("getMetadata is not implemented for the web");
  }

  static Future<void> writeMetadata(String file, Metadata metadata) async {
    throw UnimplementedError(
      "writeMetadata is not implemented for the web",
    );
  }

  static Future<String> ping() async {
    return "ping";
  }
}

import 'package:flutter_rust_bridge/flutter_rust_bridge.dart'
    hide ExternalLibrary;

import 'bridge_generated.dart' as bridge;
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

bridge.MetadataGod? _wrapper;

bridge.MetadataGod _createWrapper(ExternalLibrary lib) {
  _wrapper ??= createWrapperImpl(lib);
  return _wrapper!;
}

MetadataGod? _instance;

class MetadataGod implements bridge.MetadataGod {
  final bridge.MetadataGod _lib;
  MetadataGod._(ExternalLibrary library) : _lib = _createWrapper(library);

  /// Initialize the MetadataGod library
  /// Provide the loaded [DynamicLibrary] using the `ffi` package
  ///
  /// Caution: If you are using **Flutter**, use [FlutterMetadataGod.initialize] instead.
  ///
  /// Example:
  /// ```dart
  /// import 'package:ffi/ffi.dart';
  /// import 'package:metadata_god/metadata_god.dart';
  ///
  /// void main() {
  ///   final lib = DynamicLibrary.open('libmetadata_god.so');
  ///   MetadataGod.initialize(lib);
  ///
  ///   // Use MetadataGod
  ///   MetadataGod.instance.ping();
  ///   final metadata = MetadataGod.instance.readMetadata(file: 'file');
  ///   print(metadata.title);
  /// }
  /// ```
  static void initialize(ExternalLibrary library) {
    _instance ??= MetadataGod._(library);
  }

  static MetadataGod get instance {
    if (_instance == null) {
      throw StateError('MetadataGod not initialized');
    }
    return _instance!;
  }

  @override
  FlutterRustBridgeTaskConstMeta get kPingConstMeta => _lib.kPingConstMeta;

  @override
  FlutterRustBridgeTaskConstMeta get kReadMetadataConstMeta =>
      _lib.kReadMetadataConstMeta;

  @override
  FlutterRustBridgeTaskConstMeta get kWriteMetadataConstMeta =>
      _lib.kWriteMetadataConstMeta;

  @override
  Future<String> ping({hint}) {
    return _lib.ping(hint: hint);
  }

  @override

  /// Read metadata from a mp3, m4a, ogg & flac file
  ///
  /// The path to file must exists otherwise will throw [Exception]
  Future<bridge.Metadata> readMetadata({
    required String file,
    hint,
  }) {
    return _lib.readMetadata(file: file, hint: hint);
  }

  /// Write metadata to a mp3, m4a, ogg & flac file
  ///
  /// The path to file must exists otherwise will throw [Exception]
  @override
  Future<void> writeMetadata({
    required String file,
    required bridge.Metadata metadata,
    hint,
  }) {
    return _lib.writeMetadata(file: file, metadata: metadata, hint: hint);
  }
}

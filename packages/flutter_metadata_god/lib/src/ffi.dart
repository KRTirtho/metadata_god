// lib/src/ffi.dart
import 'package:metadata_god/metadata_god.dart';
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

abstract class FlutterMetadataGod {
  /// Initialize the MetadataGod library
  ///
  /// Example:
  /// ```dart
  /// import 'package:flutter_metadata_god/flutter_metadata_god.dart';
  /// import 'package:flutter/material.dart';
  ///
  /// void main() async {
  ///  await WidgetsFlutterBinding.ensureInitialized();
  ///  FlutterMetadataGod.initialize();
  ///
  ///  runApp(MyApp());
  /// }
  /// ```
  static void initialize() => MetadataGod.initialize(createLibraryImpl());

  /// The singleton instance of the [MetadataGod] library
  /// Same as [MetadataGod.instance]
  static MetadataGod get instance => MetadataGod.instance;
}

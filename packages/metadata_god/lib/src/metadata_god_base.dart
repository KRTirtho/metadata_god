import 'bridge_generated.dart' as bridge;
import 'ffi.dart';

bridge.MetadataGod? _api;

bridge.MetadataGod get api {
  if (_api == null) {
    throw StateError('MetadataGod not initialized');
  }
  return _api!;
}

abstract class MetadataGod {
  MetadataGod._();

  /// Initialize the MetadataGod library
  ///
  /// Example:
  /// ```dart
  /// import 'package:metadata_god/metadata_god.dart';
  /// import 'package:flutter/material.dart';
  ///
  /// void main() async {
  ///  await WidgetsFlutterBinding.ensureInitialized();
  ///  MetadataGod.initialize();
  ///
  ///  runApp(MyApp());
  /// }
  /// ```
  static void initialize() {
    _api ??= initializeDynamicLibrary();
  }

  /// Read metadata from a mp3, m4a, ogg & flac file
  ///
  /// The path to file must exists otherwise will throw [Exception]
  static Future<bridge.Metadata> readMetadata({
    required String file,
    hint,
  }) {
    return api.readMetadata(file: file, hint: hint);
  }

  /// Write metadata to a mp3, m4a, ogg & flac file
  ///
  /// The path to file must exists otherwise will throw [Exception]
  ///
  /// Example:
  /// ```dart
  /// await MetadataGod.writeMetadata(
  ///   "/path/to/audio-file",
  ///   Metadata(
  ///     title: "Leave the Door Open",
  ///     artist: "Bruno Mars, Anderson .Paak, Silk Sonic",
  ///     album: "An Evening with Silk Sonic",
  ///     genre: "R&B, Soul",
  ///     year: 2021,
  ///     albumArtist: "Bruno Mars, Anderson .Paak",
  ///     trackNumber: 1,
  ///     trackTotal: 12,
  ///     discNumber: 1,
  ///     discTotal: 5,
  ///     durationMs: 248000,
  ///     fileSize: file.lengthSync(),
  ///     picture: Picture(
  ///       data: File("/path/to/cover-image").readAsBytesSync(),
  ///       mimeType: lookupMimeType("/path/to/cover-image"),
  ///     ),
  ///   ),
  /// );
  /// ```
  static Future<void> writeMetadata({
    required String file,
    required bridge.Metadata metadata,
    hint,
  }) {
    return api.writeMetadata(file: file, metadata: metadata, hint: hint);
  }
}

extension MetadataDuration on bridge.Metadata {
  Duration? get duration =>
      durationMs == null ? null : Duration(milliseconds: durationMs!.floor());
}

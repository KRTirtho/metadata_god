import 'package:flutter/foundation.dart';

class Image {
  /// The picture's MIME type.
  final String mimeType;

  /// The image data.
  final Uint8List data;

  Image({
    required this.mimeType,
    required this.data,
  });
}

class Metadata {
  final String? title;
  final double? durationMs;
  final String? artist;
  final String? album;
  final String? albumArtist;
  final int? trackNumber;
  final int? trackTotal;
  final int? discNumber;
  final int? discTotal;
  final int? year;
  final String? genre;
  final Image? picture;
  final int? fileSize;

  Metadata({
    this.title,
    this.durationMs,
    this.artist,
    this.album,
    this.albumArtist,
    this.trackNumber,
    this.trackTotal,
    this.discNumber,
    this.discTotal,
    this.year,
    this.genre,
    this.picture,
    this.fileSize,
  });
}

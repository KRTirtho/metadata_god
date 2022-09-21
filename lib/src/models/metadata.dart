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
  /// The title of the audio file.
  final String? title;

  /// Duration of the audio file. It can be null if was not set
  final double? durationMs;

  /// The artist(s) of the audio file.
  final String? artist;

  /// The album of the audio file.
  final String? album;

  /// The album artist(s) of the audio file.
  final String? albumArtist;

  final int? trackNumber;
  final int? trackTotal;
  final int? discNumber;
  final int? discTotal;

  /// The year the track was released
  final int? year;

  /// The genre of the track
  final String? genre;

  /// The attached album-art image data with [mimeType]
  final Image? picture;

  /// The file size of the audio file
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

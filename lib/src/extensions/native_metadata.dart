import 'package:metadata_god/src/bridge_generated.dart';
import 'package:metadata_god/src/models/metadata.dart' as models;

extension ImageConversion on Image {
  models.Image toImage() {
    return models.Image(
      mimeType: mimeType,
      data: data,
    );
  }

  static Image fromImage(models.Image image) {
    return Image(
      mimeType: image.mimeType,
      data: image.data,
    );
  }
}

extension MetadataConversion on Metadata {
  models.Metadata toMetadata() {
    return models.Metadata(
      album: album,
      artist: artist,
      albumArtist: albumArtist,
      title: title,
      trackNumber: trackNumber,
      discNumber: discNumber,
      year: year,
      genre: genre,
      discTotal: discTotal,
      durationMs: durationMs,
      trackTotal: trackTotal,
      fileSize: fileSize,
      picture: picture?.toImage(),
    );
  }

  static Metadata fromMetadata(models.Metadata metadata) {
    return Metadata(
      album: metadata.album,
      artist: metadata.artist,
      albumArtist: metadata.albumArtist,
      title: metadata.title,
      trackNumber: metadata.trackNumber,
      discNumber: metadata.discNumber,
      year: metadata.year,
      genre: metadata.genre,
      discTotal: metadata.discTotal,
      durationMs: metadata.durationMs,
      trackTotal: metadata.trackTotal,
      fileSize: metadata.fileSize,
      picture: metadata.picture != null
          ? ImageConversion.fromImage(metadata.picture!)
          : null,
    );
  }
}

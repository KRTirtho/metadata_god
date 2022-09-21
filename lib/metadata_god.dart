library metadata_god;

export 'src/metadata_god.dart'
    if (dart.library.html) 'src/metadata_god_web.dart';
export 'src/models/metadata.dart';

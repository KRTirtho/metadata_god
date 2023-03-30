// lib/src/ffi.dart
import 'package:metadata_god/metadata_god.dart';
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

MetadataGod createLib() => createWrapper(createLibraryImpl());

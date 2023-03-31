import 'package:metadata_god/src/bridge_generated.dart';
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

MetadataGod? _wrapper;

MetadataGod initializeDynamicLibrary() {
  _wrapper ??= createWrapperImpl(createLibraryImpl());
  return _wrapper!;
}

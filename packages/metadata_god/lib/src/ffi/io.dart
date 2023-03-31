import 'dart:ffi';
import 'dart:io';

import 'package:metadata_god/src/bridge_generated.dart';

typedef ExternalLibrary = DynamicLibrary;

MetadataGod createWrapperImpl(ExternalLibrary dylib) => MetadataGodImpl(dylib);

DynamicLibrary createLibraryImpl() {
  const base = 'metadata_god';

  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.executable();
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('$base.dll');
  } else {
    return DynamicLibrary.open('lib$base.so');
  }
}

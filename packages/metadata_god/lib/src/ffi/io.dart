import 'dart:ffi';

import 'package:metadata_god/src/bridge_generated.dart';

typedef ExternalLibrary = DynamicLibrary;

MetadataGod createWrapperImpl(ExternalLibrary dylib) => MetadataGodImpl(dylib);

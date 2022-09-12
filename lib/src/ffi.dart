import 'dart:ffi';
import 'bridge_generated.dart';
export 'bridge_generated.dart';
import 'dart:io';

const base = 'rust';

DynamicLibrary platformSpecificDynamicLib() {
  switch (Platform.operatingSystem) {
    case 'linux':
      return DynamicLibrary.open('lib$base.so');
    case 'android':
      return DynamicLibrary.open('lib$base.so');
    case 'macos':
      return DynamicLibrary.open('$base.dylib');
    case 'ios':
      return DynamicLibrary.process();
    case 'windows':
      return DynamicLibrary.open('$base.dll');
    default:
      throw Exception('Unsupported platform');
  }
}

final RustImpl api = RustImpl(platformSpecificDynamicLib());

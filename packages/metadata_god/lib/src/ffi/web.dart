import 'package:metadata_god/src/bridge_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

typedef ExternalLibrary = WasmModule;

MetadataGod createWrapperImpl(ExternalLibrary module) =>
    MetadataGodImpl.wasm(module);

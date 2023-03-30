import 'package:metadata_god/src/bridge_generated.dart';

/// Represents the external library for metadata_god
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = Object;

MetadataGod createWrapperImpl(ExternalLibrary lib) =>
    throw UnimplementedError();

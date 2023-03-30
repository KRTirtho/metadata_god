# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_metadata_god_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_metadata_god SHARED
  "flutter_metadata_god.c"
)

set_target_properties(flutter_metadata_god PROPERTIES
  PUBLIC_HEADER flutter_metadata_god.h
  OUTPUT_NAME "flutter_metadata_god"
)

target_compile_definitions(flutter_metadata_god PUBLIC DART_SHARED_LIB)

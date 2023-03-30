#!/bin/bash

CURR_VERSION=metadata_god-v`awk '/^version: /{print $2}' packages/metadata_god/pubspec.yaml`

# iOS & macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_metadata_god/ios/flutter_metadata_god.podspec
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_metadata_god/macos/flutter_metadata_god.podspec
rm packages/flutter_metadata_god/macos/*.bak packages/flutter_metadata_god/ios/*.bak

# CMake platforms (Linux, Windows, and Android)
CMAKE_HEADER="set(LibraryVersion \"$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in android linux windows
do
    sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/flutter_metadata_god/$CMAKE_PLATFORM/CMakeLists.txt
    rm packages/flutter_metadata_god/$CMAKE_PLATFORM/*.bak
done

git add packages/flutter_metadata_god/

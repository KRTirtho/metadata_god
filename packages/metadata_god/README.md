# Metadata God

A flutter plugin for retrieving and writing audio tags/metadata from audio files. It supports almost all kind of audio files

## Supported Audio Formats

| File Format | Metadata Format       |
| ----------- | --------------------- |
| mp3         | id3v2.4               |
| m4a, mp4    | MPEG-4 audio metadata |
| flac        | Vorbis comment        |

## Installation

Run in terminal:

```bash
$ flutter pub add metadata_god
```

## Configuration
### Android 
For using `metadata_god` in Android it needs `READ_EXTERNAL_STORAGE` and `WRITE_EXTERNAL_STORAGE` permissions

So, add following green highlighted lines to `android/app/src/main/AndroidManifest.xml` file:

```diff
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.example">

+    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
+    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

  
  <application 
    android:label="Example"
    android:name="${applicationName}"
    android:icon="@mipmap/ic_launcher"
    android:usesCleartextTraffic="true"
+   android:requestLegacyExternalStorage="true"
  >
// .... rest of the file
```

Finally, use packages like `permission_handler` to request storage permissions from user if not granted already
```dart
// before calling any method of MetadataGod in android
// check if storage permission is granted or not
// if not, request for permission
  initState(){
    final hasStorageAccess = Platform.isAndroid ? await Permission.storage.isGranted : true
    if(!hasStorageAccess){
      await Permission.storage.request();
      if(!await Permission.storage.isGranted){
        return;
      }
    }
    // ... call all the metadata_god methods from here
  }
```

> Following configuration would work with file path that are allowed explicitly by android. If you want entire storage access you'll need `MANAGE_EXTERNAL_STORAGE` permission and request the user to enable access to entire storage in app info settings.

### Other platforms

Linux, Windows and MacOS doesn't need any extra configuration and good to go after installation

## Usage


```dart
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:metadata_god/metadata_god.dart';

// Initialize the plugin
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MetadataGod.initialize();
  runApp(const MyApp());
}

// Get metadata from file
Metadata metadata = await MetadataGod.getMetadata("/path/to/audio-file");

// Set metadata to file
await MetadataGod.writeMetadata(
  "/path/to/audio-file",
  Metadata(
    title: "Leave the Door Open",
    artist: "Bruno Mars, Anderson .Paak, Silk Sonic",
    album: "An Evening with Silk Sonic",
    genre: "R&B, Soul",
    year: 2021,
    albumArtist: "Bruno Mars, Anderson .Paak",
    trackNumber: 1,
    trackTotal: 12,
    discNumber: 1,
    discTotal: 5,
    durationMs: 248000,
    fileSize: file.lengthSync(),
    picture: Picture(
      data: File("/path/to/cover-image").readAsBytesSync(),
      mimeType: lookupMimeType("/path/to/cover-image"),
    ),
  ),
);
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Author

[Kingkor Roy Tirtho](https://github.com/KRTirtho)
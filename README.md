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
NDK is required to build metadata_god. You can use Android Studio SDK Manager to install the NDK:
```txt
Preferences -> Android SDK -> SDK Tools -> NDK (Side by Side).
```
**PS:** Make sure to check the "Show Package Details" checkbox and install the NDK version required by 
your current Flutter SDK. You can find it here: [stable][stable-ndk] | [master][master-ndk] or while running targeting
an Android device, you can find it in the error message.

metadata_god requires minimum API level 23 (Android 6.0). You'll need to add following lines to `android/app/build.gradle` file:

```diff
android {
    ....
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.example"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-build-configuration.
-       minSdkVersion flutter.minSdkVersion
+       minSdkVersion 23
    ....
```


`metadata_god` needs `READ_EXTERNAL_STORAGE` and `WRITE_EXTERNAL_STORAGE` permissions

Add following green highlighted lines to `android/app/src/main/AndroidManifest.xml` file:

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

Linux, Windows and MacOS, iOS doesn't need any extra configuration and good to go after installation

## Usage


```dart
import 'package:metadata_god/metadata_god.dart';
import 'package:mime/mime.dart';

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

[stable-ndk]:https://github.com/flutter/flutter/blob/stable/packages/flutter_tools/gradle/flutter.gradle#L46
[master-ndk]:https://github.com/flutter/flutter/blob/master/packages/flutter_tools/gradle/flutter.gradle#L50
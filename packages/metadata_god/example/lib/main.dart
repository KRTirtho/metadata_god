import 'package:flutter/material.dart';

import 'package:metadata_god/metadata_god.dart';
import 'package:file_picker/file_picker.dart';
import 'package:metadata_god_example/reader_data_view.dart';
import 'package:metadata_god_example/writer_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MetadataGod.initialize();
  runApp(const MyActualApp());
}

class MyActualApp extends StatelessWidget {
  const MyActualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Metadata God',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Metadata? metadata;
  PlatformFile? selectedFile;

  @override
  void initState() {
    super.initState();
    print("Calling: initState");
    selectedFile = PlatformFile(
      name: "test.m4a",
      path: "assets/test.m4a",
      size: 3700,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final metadata = await MetadataGod.readMetadata(
        file: "assets/test.m4a",
      );
      setState(() {
        this.metadata = metadata;
      });
      print("metadata.album: ${metadata.album}");
      print("metadata.albumArtist: ${metadata.albumArtist}");
      print("metadata.artist: ${metadata.artist}");
      print("metadata.discNumber: ${metadata.discNumber}");
      print("metadata.discTotal: ${metadata.discTotal}");
      print("metadata.durationMs: ${metadata.durationMs}");
      print("metadata.fileSize: ${metadata.fileSize}");
      print("metadata.genre: ${metadata.genre}");
      print("metadata.picture: ${metadata.picture?.mimeType}");
      print("metadata.title: ${metadata.title}");
      print("metadata.trackNumber: ${metadata.trackNumber}");
      print("metadata.trackTotal: ${metadata.trackTotal}");
      print("metadata.year: ${metadata.year}");
    });
    print("End: initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Packages'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("Select a audio file: ${selectedFile?.name ?? ""}"),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final result = await FilePicker.platform.pickFiles(
                              type: FileType.audio,
                              allowCompression: false,
                              allowMultiple: false,
                              withData: false,
                              withReadStream: false,
                            );

                            if (result == null) return;
                            final fileMetadata = await MetadataGod.readMetadata(
                                file: result.files.first.path!);

                            setState(() {
                              metadata = fileMetadata;
                              selectedFile = result.files.first;
                            });
                          },
                          child: const Text("Select"),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: selectedFile == null
                              ? null
                              : () async {
                                  final writable = await showDialog<Metadata?>(
                                    context: context,
                                    builder: (context) =>
                                        WriterView(metadata: metadata),
                                  );

                                  if (writable == null) return;
                                  await MetadataGod.writeMetadata(
                                    file: selectedFile!.path!,
                                    metadata: writable,
                                  );
                                  final fileMetadata =
                                      await MetadataGod.readMetadata(
                                    file: selectedFile!.path!,
                                  );
                                  setState(() {
                                    metadata = fileMetadata;
                                  });
                                },
                          label: const Text("Edit"),
                          icon: const Icon(Icons.edit_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (metadata != null)
                ReaderDataView(
                  metadata: metadata!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

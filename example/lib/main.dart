import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    final file = File(Platform.isAndroid
        ? "/storage/emulated/0/Download/Spotube/shyaway.m4a"
        : "/home/krtirtho/Downloads/Spotube/shyaway.m4a");
    super.initState();
    () async {
      MetadataGod.ping().then((ping) => print("PING: $ping"));
      final hasStorageAccess =
          Platform.isAndroid ? await Permission.storage.isGranted : true;
      if (!hasStorageAccess) return;
      await file.writeAsBytes(await file.readAsBytes());
      MetadataGod.getMetadata(file).then((value) {
        final v = value;
        if (v == null) return;
        MetadataGod.writeMetadata(
          file,
          Metadata(
            title: v.title,
            artist: v.artist,
            album: v.album,
            genre: "Alternative Rock",
            year: DateTime.now().year,
            albumArtist: v.albumArtist,
            trackNumber: v.trackNumber,
            trackTotal: v.trackTotal,
            discNumber: v.discNumber,
            discTotal: v.discTotal,
            durationMs: v.durationMs,
            fileSize: Random().nextInt(100000),
            picture: v.picture,
          ),
        );
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

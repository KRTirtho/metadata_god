import 'package:flutter/material.dart';
import 'package:flutter_metadata_god/flutter_metadata_god.dart';

class WriterView extends StatefulWidget {
  final Metadata? metadata;
  const WriterView({
    Key? key,
    this.metadata,
  }) : super(key: key);

  @override
  State<WriterView> createState() => _WriterViewState();
}

class _WriterViewState extends State<WriterView> {
  late TextEditingController titleController;
  late TextEditingController durationMsController;
  late TextEditingController artistController;
  late TextEditingController albumController;
  late TextEditingController albumArtistController;
  late TextEditingController trackNumberController;
  late TextEditingController trackTotalController;
  late TextEditingController discNumberController;
  late TextEditingController discTotalController;
  late TextEditingController yearController;
  late TextEditingController genreController;
  late TextEditingController pictureController;
  late TextEditingController fileSizeController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.metadata?.title);
    durationMsController =
        TextEditingController(text: widget.metadata?.durationMs?.toString());
    artistController = TextEditingController(text: widget.metadata?.artist);
    albumController = TextEditingController(text: widget.metadata?.album);
    albumArtistController =
        TextEditingController(text: widget.metadata?.albumArtist);
    genreController = TextEditingController(text: widget.metadata?.genre);
    trackNumberController =
        TextEditingController(text: widget.metadata?.trackNumber.toString());
    trackTotalController =
        TextEditingController(text: widget.metadata?.trackTotal.toString());
    discNumberController =
        TextEditingController(text: widget.metadata?.discNumber.toString());
    discTotalController =
        TextEditingController(text: widget.metadata?.discTotal.toString());
    yearController =
        TextEditingController(text: widget.metadata?.year.toString());
    pictureController =
        TextEditingController(text: widget.metadata?.picture.toString());
    fileSizeController =
        TextEditingController(text: widget.metadata?.fileSize.toString());
  }

  @override
  void dispose() {
    titleController.dispose();
    durationMsController.dispose();
    artistController.dispose();
    albumController.dispose();
    albumArtistController.dispose();
    trackNumberController.dispose();
    trackTotalController.dispose();
    discNumberController.dispose();
    discTotalController.dispose();
    yearController.dispose();
    genreController.dispose();
    pictureController.dispose();
    fileSizeController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        scrollable: true,
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(
                Metadata(
                  album: albumController.text,
                  albumArtist: albumArtistController.text,
                  artist: artistController.text,
                  discNumber: int.tryParse(discNumberController.text) ?? 0,
                  discTotal: int.tryParse(discTotalController.text) ?? 0,
                  durationMs: double.tryParse(durationMsController.text) ?? 0.0,
                  fileSize: int.tryParse(fileSizeController.text) ?? 0,
                  genre: genreController.text,
                  picture: null,
                  title: titleController.text,
                  trackNumber: int.tryParse(trackNumberController.text) ?? 0,
                  trackTotal: int.tryParse(trackTotalController.text) ?? 0,
                  year: int.tryParse(yearController.text) ?? 0,
                ),
              );
            },
            child: const Text("Save"),
          ),
        ],
        title: const Text("Write Metadata"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "title"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: durationMsController,
              decoration: const InputDecoration(labelText: "durationMs"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: artistController,
              decoration: const InputDecoration(labelText: "artist"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: albumController,
              decoration: const InputDecoration(labelText: "album"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: albumArtistController,
              decoration: const InputDecoration(labelText: "albumArtist"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: trackNumberController,
              decoration: const InputDecoration(labelText: "trackNumber"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: trackTotalController,
              decoration: const InputDecoration(labelText: "trackTotal"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: discNumberController,
              decoration: const InputDecoration(labelText: "discNumber"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: discTotalController,
              decoration: const InputDecoration(labelText: "discTotal"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: yearController,
              decoration: const InputDecoration(labelText: "year"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: genreController,
              decoration: const InputDecoration(labelText: "genre"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: fileSizeController,
              decoration: const InputDecoration(labelText: "fileSize"),
            ),
          ],
        ),
      ),
    );
  }
}

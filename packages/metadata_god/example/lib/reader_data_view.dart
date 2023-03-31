import 'package:flutter/material.dart';
import 'package:metadata_god/metadata_god.dart';

class ReaderDataView extends StatelessWidget {
  final Metadata metadata;
  const ReaderDataView({Key? key, required this.metadata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Key")),
        DataColumn(label: Text("Value")),
      ],
      rows: [
        DataRow(
          cells: [
            const DataCell(Text("album")),
            DataCell(Text(metadata.album ?? "")),
          ],
        ),
        DataRow(cells: [
          const DataCell(Text("albumArtist")),
          DataCell(Text(metadata.albumArtist ?? "")),
        ]),
        DataRow(cells: [
          const DataCell(Text("artist")),
          DataCell(Text(metadata.artist ?? "")),
        ]),
        DataRow(cells: [
          const DataCell(Text("discNumber")),
          DataCell(Text(metadata.discNumber.toString())),
        ]),
        DataRow(cells: [
          const DataCell(Text("discTotal")),
          DataCell(Text(metadata.discTotal.toString())),
        ]),
        DataRow(cells: [
          const DataCell(Text("durationMs")),
          DataCell(Text("${metadata.durationMs} ms")),
        ]),
        DataRow(cells: [
          const DataCell(Text("fileSize")),
          DataCell(Text(metadata.fileSize.toString())),
        ]),
        DataRow(cells: [
          const DataCell(Text("genre")),
          DataCell(Text(metadata.genre ?? "")),
        ]),
        DataRow(cells: [
          const DataCell(Text("picture")),
          DataCell(
            metadata.picture?.data != null
                ? Image.memory(metadata.picture!.data)
                : const Text(""),
          ),
        ]),
        DataRow(cells: [
          const DataCell(Text("title")),
          DataCell(Text(metadata.title ?? "")),
        ]),
        DataRow(cells: [
          const DataCell(Text("trackNumber")),
          DataCell(Text(metadata.trackNumber.toString())),
        ]),
        DataRow(cells: [
          const DataCell(Text("trackTotal")),
          DataCell(Text(metadata.trackTotal.toString())),
        ]),
        DataRow(cells: [
          const DataCell(Text("year")),
          DataCell(Text(metadata.year.toString())),
        ]),
      ],
    );
  }
}

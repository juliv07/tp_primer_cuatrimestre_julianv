import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_primer_cuatrimestre/entities/Album.dart';
import 'package:tp_primer_cuatrimestre/providers/album_provider.dart';

class EditAlbumScreen extends ConsumerWidget {
  const EditAlbumScreen({super.key});
  static const String name = 'editAlbum';

  @override
  Widget build(BuildContext context, ref) {

    final int selectedAlbumIndex = ref.watch(selectedAlbumIndexProvider);

    final List<Album> albumList = ref.watch(albumProvider);

    final String name = albumList[selectedAlbumIndex].name;
    final String artist = albumList[selectedAlbumIndex].artist;
    final String description = albumList[selectedAlbumIndex].description;
    final String imgURL = albumList[selectedAlbumIndex].imgURL;

    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController artistController = TextEditingController(text: artist);
    TextEditingController descriptionController = TextEditingController(text: description);
    TextEditingController imgURLController = TextEditingController(text: imgURL);

    return const Scaffold(
      

    );
  }
}
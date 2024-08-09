import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_primer_cuatrimestre/entities/Album.dart';
import 'package:tp_primer_cuatrimestre/providers/album_provider.dart';

class AlbumScreen extends ConsumerWidget {
  const AlbumScreen({super.key});
  static const String name = 'album';

  @override
  Widget build(BuildContext context, ref) {

    List<Album> albumList = ref.watch(albumProvider);
    int selectedAlbumIndex = ref.watch(selectedAlbumIndexProvider);

    return Scaffold(
      //appBar: AppBar(title: Text(albumList[selectedAlbumIndex].albumName),),
        body: SingleChildScrollView( 
          child: Center(
          child: Padding(padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Image.network(albumList[selectedAlbumIndex].imgURL),
                const SizedBox(height: 30.0),
                Text(albumList[selectedAlbumIndex].albumName,
                style: const TextStyle(fontSize: 24),),
                const SizedBox(height: 30.0),
                Text(albumList[selectedAlbumIndex].description),

                ElevatedButton(
                  onPressed:(){ 
                    ref.read(actionAddProvider.notifier).state = false;
                    context.push('/editAlbum');
                  },
                  child: const Text('Edit'),
                ),

                ElevatedButton(
                  onPressed:(){ 
                    ref.read(albumProvider.notifier).state.removeAt(selectedAlbumIndex);
                    ref.read(selectedAlbumIndexProvider.notifier).state = albumList.length-2;
                    context.push('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
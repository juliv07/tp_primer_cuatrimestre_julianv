import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_primer_cuatrimestre/entities/Album.dart';
import 'package:tp_primer_cuatrimestre/providers/album_provider.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home';
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    List<Album> albumList = ref.watch(albumProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(color: Color.fromARGB(255, 228, 118, 0)),
        ),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: albumList.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 194, 245, 255),
              child: ListTile(
                title: Text(albumList[index].albumName),
                subtitle: Text(albumList[index].artist),
                leading:Image.network(albumList[index].imgURL),
                onTap: (){
                  ref.read(selectedAlbumIndexProvider.notifier).state = index;
                  ref.read(selectedAlbumProvider.notifier).state = albumList[index].albumName;
                  
                  print('Index: $index');
                  final a = albumList[index].albumName;
                  print('name: $a');

                  context.push('/album',);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(actionAddProvider.notifier).state = true;
          ref.read(selectedAlbumProvider.notifier).state = '';
          ref.read(selectedAlbumIndexProvider.notifier).state = albumList.length-1;
          
          context.push('/editAlbum');
        },
        child: const Text('+'),
      ),
    );
  }
}

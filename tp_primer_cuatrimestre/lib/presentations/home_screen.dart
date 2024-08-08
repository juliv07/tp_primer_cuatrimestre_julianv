import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_primer_cuatrimestre/presentations/album_screen.dart';
import 'package:tp_primer_cuatrimestre/providers/album_provider.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home';
  final String userName;
  HomeScreen({super.key, this.userName = ''});

  @override
  Widget build(BuildContext context, ref) {

    List albumList = ref.watch(albumProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome $userName',
          style: const TextStyle(color: Color.fromARGB(255, 228, 118, 0)),
        ),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: albumList.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 194, 245, 255),
              child: ListTile(
                title: Text(albumList[index].name),
                subtitle: Text(albumList[index].artist),
                leading:Image.network(albumList[index].imgURL),
                onTap: (){
                  ref.read(selectedAlbumIndexProvider.notifier).state = index;
                  context.pushNamed(AlbumScreen.name,);
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

          context.push('/albumScreen');
        },
        child: const Text('+'),
      ),
    );
  }
}

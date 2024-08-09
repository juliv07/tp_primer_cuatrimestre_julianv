import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_primer_cuatrimestre/entities/Album.dart';
import 'package:tp_primer_cuatrimestre/providers/album_provider.dart';

class EditAlbumScreen extends ConsumerWidget {
  const EditAlbumScreen({super.key});
  static const String name = 'editAlbum';

  @override
  Widget build(BuildContext context, ref) {

    final int selectedAlbumIndex = ref.watch(selectedAlbumIndexProvider);
    final List<Album> albumList = ref.watch(albumProvider);
    final bool actionAdd = ref.watch(actionAddProvider);

    final String albumName = albumList[selectedAlbumIndex].albumName;
    final String artist = albumList[selectedAlbumIndex].artist;
    final String description = albumList[selectedAlbumIndex].description;
    final String imgURL = albumList[selectedAlbumIndex].imgURL;

    TextEditingController albumNameController = TextEditingController();
    TextEditingController artistController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController imgURLController = TextEditingController();

    if(ref.watch(selectedAlbumProvider)!=''){
      albumNameController = TextEditingController(text: albumName);
      artistController = TextEditingController(text: artist);
      descriptionController = TextEditingController(text: description);
      imgURLController = TextEditingController(text: imgURL);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Album configuration'),),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Visibility(
                visible: actionAdd,
                child: const Text('New album')
              ),
              
              Visibility(
                visible: !actionAdd,
                child: Text(albumName)
              ),

              const SizedBox(height: 30),

              TextField(
                controller: albumNameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  icon: Icon(
                    Icons.album,
                    color: Color.fromARGB(255, 184, 184, 184),
                  )
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: artistController,
                decoration: const InputDecoration(
                  hintText: 'Artist',
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 184, 184, 184),
                  )
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  icon: Icon(
                    Icons.description,
                    color: Color.fromARGB(255, 184, 184, 184),
                  )
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: imgURLController,
                decoration: const InputDecoration(
                  hintText: 'Cover (url)',
                  icon: Icon(
                    Icons.image,
                    color: Color.fromARGB(255, 184, 184, 184),
                  )
                ),
              ),

              //ADD
              Visibility(
                visible: actionAdd,
                child: ElevatedButton(
                  onPressed: (){
                    if(imgURLController.text.isEmpty){
                      imgURLController.text = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCTe2iI61LN_84uVeswl8ahf-vpaY6fd_0-g&usqp=CAU';
                    }
                    if(
                      albumNameController.text.isNotEmpty && artistController.text.isNotEmpty && 
                      descriptionController.text.isNotEmpty && imgURLController.text.isNotEmpty
                    ){
                      ref.read(albumProvider.notifier).state.add(
                        Album(
                          albumName: albumNameController.text, 
                          artist: artistController.text, 
                          description: descriptionController.text, 
                          imgURL: imgURLController.text,
                        ),
                      );
                      context.go('/home');
                    } 
                    if(
                      albumNameController.text.isEmpty || artistController.text.isEmpty ||
                      descriptionController.text.isEmpty || imgURLController.text.isEmpty
                      ){
                        SnackBar emptyFields = SnackBar(
                        content: const Text('Complete all the fields.',
                          style: TextStyle(color: Colors.white)),
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(emptyFields);
                    }
                  }, 
                  child: const Text('Done, add')
                ),
              ),

              //EDIT
              Visibility(
                visible: !actionAdd,
                child :ElevatedButton(
                  onPressed: (){
                    if(imgURLController.text.isEmpty){
                      imgURLController.text = 'https://www.elliottcarter.com/site/assets/files/2844/00.458x0.png';
                    }
                    if(
                      albumNameController.text.isNotEmpty && artistController.text.isNotEmpty && 
                      descriptionController.text.isNotEmpty && imgURLController.text.isNotEmpty
                    ){
                      ref.read(albumProvider.notifier).state[selectedAlbumIndex].albumName = albumNameController.text;
                      ref.read(albumProvider.notifier).state[selectedAlbumIndex].artist = artistController.text;
                      ref.read(albumProvider.notifier).state[selectedAlbumIndex].description = descriptionController.text;
                      ref.read(albumProvider.notifier).state[selectedAlbumIndex].imgURL = imgURLController.text;

                      context.go('/home');
                    } 
                    if(
                      albumNameController.text.isEmpty || artistController.text.isEmpty ||
                      descriptionController.text.isEmpty || imgURLController.text.isEmpty
                      ){
                        SnackBar emptyFields = SnackBar(
                        content: const Text('Complete all the fields',
                          style: TextStyle(color: Colors.white)),
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(emptyFields);
                    }
                  },
                  child: const Text('Done')
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}
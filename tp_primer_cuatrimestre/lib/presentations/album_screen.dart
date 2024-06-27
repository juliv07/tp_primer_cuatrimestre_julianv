
import 'package:flutter/material.dart';
import 'package:tp_primer_cuatrimestre/entities/Album.dart';

class AlbumScreen extends StatelessWidget {
  static const String name = 'album';
  final String albumIndex;
  AlbumScreen({super.key, this.albumIndex = ''});

  List<Album> albumList=[
      Album(name:'Destinología',artist:'Tan Biónica',
            imgURL: 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Destinolog%C3%ADa_logo.png',
            description: '"Destinología" es el tercer álbum de estudio de Tan Biónica, lanzado en 2013. Este disco representa un cambio en la dirección musical de la banda argentina, alejándose un poco del pop rock inicial para explorar sonidos más electrónicos y bailables.\n\nEl álbum está compuesto por canciones que fusionan elementos pop con influencias de la música electrónica y el dance, creando un estilo fresco y moderno. Entre los temas destacados se encuentran "Ella" y "La Melodía de Dios".\n\n"Destinología" también se caracteriza por letras que abordan temas románticos y reflexivos, con un enfoque en la conexión emocional y los sentimientos personales. Es considerado como un disco que marcó un momento importante en la evolución musical de Tan Biónica, consolidando su popularidad en América Latina.'
            ),
      Album(name:'21',artist:'Adele',
            imgURL: 'https://upload.wikimedia.org/wikipedia/en/1/1b/Adele_-_21.png',
            description: 'El álbum "21" de Adele, lanzado en 2011, es un hito en su carrera y en la música contemporánea. Con una voz poderosa y emotiva, Adele cautiva al público con canciones que exploran el amor, el desamor y la introspección personal.\n\nEste álbum se destaca por temas como "Rolling in the Deep", una poderosa balada que mezcla soul y pop con letras emotivas y una interpretación vocal intensa. Otros éxitos incluyen "Someone Like You", una balada desgarradora que habla sobre el perdón y la aceptación tras una ruptura amorosa, y "Set Fire to the Rain", una canción que combina la melancolía con una producción impresionante.\n\nLas letras de "21" son profundas y honestas, reflejando las experiencias personales de Adele con el amor y las relaciones. Su voz, llena de emoción y autenticidad, junto con la habilidad para contar historias a través de la música, convierten a este álbum en un clásico moderno que resonó tanto comercialmente como críticamente en todo el mundo.'
            ),
      Album(name:'Music Of The Spheres',artist:'Coldplay',
            imgURL: 'https://upload.wikimedia.org/wikipedia/en/b/bf/Coldplay_-_Music_of_the_Spheres_%28Official_Album_Artwork%29.png',
            description: '"Music of the Spheres" es el noveno álbum de estudio de la banda británica Coldplay, lanzado en 2021. Este álbum representa un regreso a las raíces más experimentales y ambientales de la banda, combinando elementos de pop, rock y electrónica con influencias cósmicas y espaciales.\n\nEl álbum está estructurado en una narrativa cósmica que explora temas de conexión humana, espiritualidad y el universo. Canciones como "Higher Power" y "Coloratura" son ejemplos de la fusión del sonido característico de Coldplay con toques de electrónica y sintetizadores, creando una experiencia auditiva expansiva y emotiva.\n\n"Music of the Spheres" también se destaca por sus letras introspectivas y poéticas, que invitan a reflexionar sobre la existencia y el lugar del individuo en el cosmos. La producción del álbum es sofisticada y meticulosa, con capas de sonidos que dan profundidad y textura a cada pista.\n\nEn resumen, "Music of the Spheres" es un viaje sonoro que lleva a los oyentes a través de paisajes emocionales y conceptuales, mostrando la evolución continua de Coldplay como una de las bandas más influyentes y visionarias de su generación.'
            ),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(albumList[int.parse(albumIndex)].name),),
        body: SingleChildScrollView( 
          child: Center(
          child: Padding(padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Image.network(albumList[int.parse(albumIndex)].imgURL),
                const SizedBox(height: 30.0),
                Text(albumList[int.parse(albumIndex)].name,
                style: const TextStyle(fontSize: 24),),
                const SizedBox(height: 30.0),
                Text(albumList[int.parse(albumIndex)].description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
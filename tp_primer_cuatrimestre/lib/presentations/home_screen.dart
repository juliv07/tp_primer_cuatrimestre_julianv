import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_primer_cuatrimestre/entities/Album.dart';
import 'package:tp_primer_cuatrimestre/presentations/album_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  final String userName;
  HomeScreen({super.key, this.userName = ''});

  @override
  Widget build(BuildContext context) {
    List<Album> albumList=[
      Album(name:'Canciones del Huracán',artist:'Tan Biónica',
            imgURL: 'https://www.cmtv.com.ar/tapas-cd/tanbionicahuracan.webp',
            description: 'Canciones del huracán es el primer álbum de estudio del grupo musical Tan Biónica. Fue grabado entre 2006 y 2007, y fue reeditado en 2009 junto con la reproducción extendida titulada Wonderful noches. El álbum se plantea mucho más rockero que su predecesor, con constante presencia de guitarras eléctricas, ritmos frenéticos y una mayor potencia en la voz del vocalista. Las letras en la mayoría de las canciones del álbum parecen hablar acerca del consumo de narcóticos y las consecuencias que esto deja mediante metáforas, pero también toca otros temas como el amor, desamor y la depresión. Canciones como “La depresión” y “Chica biónica” parecen hablar sobre una mujer cuya adicción a las drogas la destroza y la vuelca hacia un estado depresivo, del cual solo parece escapar consumiendo más narcóticos. Mientras tanto, canciones como “Vinidy Swing” y “Mis madrugaditas” hablan sobre festejar sin motivo aparente (“…hoy quiero festejar que no festejo solo”) y entregarse a los vicios sin sentir ningún tipo de culpa al respecto. 🎵🌪️'
            ),
      Album(name:'Obsesionario',artist:'Tan Biónica',
            imgURL: 'https://i.scdn.co/image/ab67616d0000b273db56534f31217a77244b7e8f',
            description: 'Obsesionario es el segundo álbum de estudio del grupo musical argentino Tan Biónica, publicado el 1 de octubre de 2010. Con los éxitos como «Ella», «Beautiful», «Obsesionario en la mayor», «Loca» y «Pétalos», el grupo musical llegó nuevamente a las listas de las radios más importantes del país, y alcanzó una fuerte rotación en los canales de música nacionales e internacionales.'
            ),
      Album(name:'Destinología',artist:'Tan Biónica',
            imgURL: 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Destinolog%C3%ADa_logo.png',
            description: '"Destinología" es el tercer álbum de estudio de Tan Biónica, lanzado en 2013. Este disco representa un cambio en la dirección musical de la banda argentina, alejándose un poco del pop rock inicial para explorar sonidos más electrónicos y bailables.\n\nEl álbum está compuesto por canciones que fusionan elementos pop con influencias de la música electrónica y el dance, creando un estilo fresco y moderno. Entre los temas destacados se encuentran "Ella" y "La Melodía de Dios".\n\n"Destinología" también se caracteriza por letras que abordan temas románticos y reflexivos, con un enfoque en la conexión emocional y los sentimientos personales. Es considerado como un disco que marcó un momento importante en la evolución musical de Tan Biónica, consolidando su popularidad en América Latina.'
            ),
      Album(name:'Hola Mundo',artist:'Tan Biónica',
            imgURL: 'https://miro.medium.com/v2/resize:fit:960/1*EWI-eDdKbOk6rYO2R5GCHQ.jpeg',
            description: 'Hola mundo es el cuarto y último álbum de estudio de la banda argentina Tan Biónica. Fue lanzado el 18 de mayo de 2015. La edición de este trabajo representó para el grupo una nueva etapa, dado que fue el primero en ser lanzado simultáneamente en Argentina y otros países hispanoamericanos, a través del sello Universal Music Group, con el cual habían firmado contrato en marzo de 2014. Además, según el bajista y director musical del grupo, Bambi, también fue "una aventura musical diferente" donde las canciones tuvieron "otro rumbo, otros riesgos". Contó con la participación de la Orquesta Filarmónica de Praga en algunas canciones.'
            ),
      Album(name:'21',artist:'Adele',
            imgURL: 'https://upload.wikimedia.org/wikipedia/en/1/1b/Adele_-_21.png',
            description: 'El álbum "21" de Adele, lanzado en 2011, es un hito en su carrera y en la música contemporánea. Con una voz poderosa y emotiva, Adele cautiva al público con canciones que exploran el amor, el desamor y la introspección personal.\n\nEste álbum se destaca por temas como "Rolling in the Deep", una poderosa balada que mezcla soul y pop con letras emotivas y una interpretación vocal intensa. Otros éxitos incluyen "Someone Like You", una balada desgarradora que habla sobre el perdón y la aceptación tras una ruptura amorosa, y "Set Fire to the Rain", una canción que combina la melancolía con una producción impresionante.\n\nLas letras de "21" son profundas y honestas, reflejando las experiencias personales de Adele con el amor y las relaciones. Su voz, llena de emoción y autenticidad, junto con la habilidad para contar historias a través de la música, convierten a este álbum en un clásico moderno que resonó tanto comercialmente como críticamente en todo el mundo.'
            ),
      Album(name:'25',artist:'Adele',
            imgURL: 'https://upload.wikimedia.org/wikipedia/en/9/96/Adele_-_25_%28Official_Album_Cover%29.png',
            description: '"25" es el tercer álbum de estudio de la cantante británica Adele, lanzado el 20 de noviembre de 2015. Este álbum marca el regreso de Adele después de un paréntesis de casi cinco años desde su exitoso "21". Con "25", Adele explora temas de nostalgia, arrepentimiento y autorreflexión, reflejando su madurez personal y artística.\n\nEl álbum abre con "Hello", una poderosa balada que se convirtió en un éxito mundial y que destaca por su emotividad y la impresionante voz de Adele. Otros temas destacados incluyen "When We Were Young", una melancólica mirada a la juventud pasada, y "Send My Love (To Your New Lover)", una canción más rítmica y alegre que muestra una faceta diferente de la artista.\n\n"25" recibió elogios de la crítica por su producción impecable y la emotividad de las interpretaciones de Adele. El álbum fue un éxito comercial masivo, rompiendo varios récords de ventas en su primera semana y consolidando a Adele como una de las artistas más importantes de su generación.'
            ),
      Album(name:'Music Of The Spheres',artist:'Coldplay',
            imgURL: 'https://upload.wikimedia.org/wikipedia/en/b/bf/Coldplay_-_Music_of_the_Spheres_%28Official_Album_Artwork%29.png',
            description: '"Music of the Spheres" es el noveno álbum de estudio de la banda británica Coldplay, lanzado en 2021. Este álbum representa un regreso a las raíces más experimentales y ambientales de la banda, combinando elementos de pop, rock y electrónica con influencias cósmicas y espaciales.\n\nEl álbum está estructurado en una narrativa cósmica que explora temas de conexión humana, espiritualidad y el universo. Canciones como "Higher Power" y "Coloratura" son ejemplos de la fusión del sonido característico de Coldplay con toques de electrónica y sintetizadores, creando una experiencia auditiva expansiva y emotiva.\n\n"Music of the Spheres" también se destaca por sus letras introspectivas y poéticas, que invitan a reflexionar sobre la existencia y el lugar del individuo en el cosmos. La producción del álbum es sofisticada y meticulosa, con capas de sonidos que dan profundidad y textura a cada pista.\n\nEn resumen, "Music of the Spheres" es un viaje sonoro que lleva a los oyentes a través de paisajes emocionales y conceptuales, mostrando la evolución continua de Coldplay como una de las bandas más influyentes y visionarias de su generación.'
            ),
      
    ];

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
                onTap: (){context.pushNamed(AlbumScreen.name, extra: index.toString());},
              ),
            );
          },
        ),
      ),
    );
  }
}

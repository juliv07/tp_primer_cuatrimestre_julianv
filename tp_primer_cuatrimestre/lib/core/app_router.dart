import 'package:go_router/go_router.dart';
import 'package:tp_primer_cuatrimestre/presentations/album_screen.dart';
import 'package:tp_primer_cuatrimestre/presentations/edit_album_screen.dart';
import 'package:tp_primer_cuatrimestre/presentations/home_screen.dart';
import 'package:tp_primer_cuatrimestre/presentations/login_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/login',
    builder: (  context, state) => const LoginScreen(),
  ),

  GoRoute(
    name: HomeScreen.name,
    path: '/home', 
    builder: (context, state) => HomeScreen()
  ),

  GoRoute(
    name: AlbumScreen.name,
    path: '/album', 
    builder: (context, state) => AlbumScreen()
  ),

  GoRoute(
    name: EditAlbumScreen.name,
    path: '/editAlbum', 
    builder: (context, state) => EditAlbumScreen()
  ),
]);
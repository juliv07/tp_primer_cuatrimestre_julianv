import 'package:go_router/go_router.dart';
import 'package:tp_primer_cuatrimestre/presentations/album_screen.dart';
import 'package:tp_primer_cuatrimestre/presentations/home_screen.dart';
import 'package:tp_primer_cuatrimestre/presentations/login_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/',
    builder: (  context, state) => LoginScreen(),
  ),

  GoRoute(
    name: HomeScreen.name,
    path: '/home', 
    builder: (context, state) => HomeScreen(userName: state.extra as String)),

  GoRoute(
    name: AlbumScreen.name,
    path: '/album', 
    builder: (context, state) => AlbumScreen(albumIndex: state.extra as String)),
]);
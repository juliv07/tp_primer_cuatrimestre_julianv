import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_primer_cuatrimestre/entities/User.dart';

StateProvider<List<User>> userProvider = StateProvider((ref)=>[
  User(name: 'julivino', password: 'holaa'),
  User(name: 'pirulo123', password: '123456789'),
  User(name: 'fulano456', password: 'qwertyuiop'),
]);
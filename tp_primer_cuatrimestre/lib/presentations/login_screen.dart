import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_primer_cuatrimestre/entities/User.dart';
import 'package:tp_primer_cuatrimestre/presentations/home_screen.dart';
import 'package:tp_primer_cuatrimestre/providers/user_provider.dart';

class LoginScreen extends ConsumerWidget {
  static const String name = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    TextEditingController userController = TextEditingController();
    TextEditingController pswdController = TextEditingController();

    final List<User> userList = ref.watch(userProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: userController,
                  decoration: const InputDecoration(
                      hintText: 'Username',
                      icon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 50, 143, 255),
                      ))),
              TextField(
                obscureText: true,
                controller: pswdController,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    icon: Icon(
                      Icons.lock_outline_rounded,
                      color: Color.fromARGB(255, 255, 0, 0),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  String inputUser = userController.text;
                  String inputPswd = pswdController.text;

                  if (inputUser.isEmpty || inputPswd.isEmpty) {
                    SnackBar emptyFields = SnackBar(
                      content: const Text('Complete todos los campos.',
                          style: TextStyle(color: Colors.black)),
                      backgroundColor: const Color.fromARGB(181, 24, 241, 107),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(emptyFields);
                    return;
                  }
                  
                  if(
                    userList.any((User)=>
                    User.name==inputUser &&
                    User.password==inputPswd
                    )
                  ) {
                    context.pushReplacementNamed(HomeScreen.name);
                  }
                  else{
                    SnackBar incorrectPswd = SnackBar(
                        content: const Text('Usuario o contraseña incorrectos.',
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: const Color.fromARGB(204, 255, 40, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(incorrectPswd);
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
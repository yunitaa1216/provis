import 'package:flutter/material.dart';
import 'package:prak_provis/view/login/login_view.dart';
import 'package:prak_provis/view/login/login_widget.dart';
import 'package:prak_provis/view/register/register.dart';
import 'package:prak_provis/view/welcome_screen/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(), // Rute untuk halaman welcome screen
        '/login': (context) => LoginView(), // Rute untuk halaman login
        '/register':(context) => Register()
      },
    );
  }
}

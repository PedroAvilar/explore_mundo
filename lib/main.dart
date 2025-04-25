import 'package:explore_mundo/pages/contato_page.dart';
import 'package:explore_mundo/pages/destinos_page.dart';
import 'package:explore_mundo/pages/pacotes_page.dart';
import 'package:explore_mundo/pages/sobre_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/destinos_page': (context) => const DestinosPage(),
        '/pacotes_page': (context) => const PacotesPage(),
        '/sobre_page': (context) => const SobrePage(),
        '/contato_page': (context) => const ContatoPage(),
      },
    );
  }
}
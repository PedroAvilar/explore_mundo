import 'package:flutter/material.dart';
import '../widgets/menu_navegacao.dart';

//Classe da tela inicial
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //Método que constrói a interface da HomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Mundo'),
      ),
      //Menu lateral de navegação
      drawer: MenuNavegacao(
        aoSelecionar: (rota) {
          if (rota != '/') {
            Navigator.pushNamed(context, rota);
          }
        },
      ),
      //Corpo da tela
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Bem-vindo ao Explore Mundo!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Escolha um destino e comece sua jornada.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
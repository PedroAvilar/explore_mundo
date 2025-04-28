import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:flutter/material.dart';

//Classe da tela inicial
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //Método que constrói a interface da HomePage
  @override
  Widget build(BuildContext context) {
    return TelaBase(
      //Título na AppBar
      titulo: 'Explore Mundo',
      //Corpo da tela
      corpo: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Bem-vindo ao Explore Mundo!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Text(
                'Acesse o menu e escolha um destino.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                'Comece sua jornada.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
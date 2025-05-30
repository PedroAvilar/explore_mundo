import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/menu_navegacao.dart';

//Classe que representa uma tela base
class TelaBase extends StatelessWidget {
  final String titulo;
  final Widget corpo;

  //Construtor
  const TelaBase({
    super.key,
    required this.titulo,
    required this.corpo
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra superior com título dinâmico
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.lightBlueAccent,
      ),
      //Menu lateral reutilizável
      drawer: MenuNavegacao(
        aoSelecionar: (rota) {
          if (ModalRoute.of(context)?.settings.name != rota) {
            Navigator.pushNamed(context, rota);
          }
        },
      ),
      //Corpo da tela
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 230, 247, 255),
          child: corpo,
        )
      ),
    );
  }
}
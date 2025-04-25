import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/tela_base.dart';

//Tela com informações de contato da Explore Mundo
class ContatoPage extends StatelessWidget {
  const ContatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TelaBase(
      //Título na AppBar
      titulo: 'Contato',
      //Corpo da tela
      corpo: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Entre em contato conosco!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text(
              'E-mail:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'contato@exploremundo.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Telefone:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              '+55 (11) 93344-5566',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Endereço:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Avenida das Viagens, 12345 - São Paulo, SP - Brasil',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      )
    );
  }
}
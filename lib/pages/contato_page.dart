import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:explore_mundo/widgets/botoes_acoes.dart';

//Tela com informações de contato da Explore Mundo
class ContatoPage extends StatelessWidget {
  const ContatoPage({super.key});

  final String email = 'contato@exploremundo.com';
  final String telefone = '+55 (11) 93344-5566';
  final String endereco = 'Avenida das Viagens, 12345 - São Paulo, SP - Brasil';

  @override
  Widget build(BuildContext context) {
    return TelaBase(
      //Título na AppBar
      titulo: 'Contato',
      //Corpo da tela
      corpo: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Entre em contato conosco',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 50),

            //E-mail
            const Text(
              'E-mail:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 16),
            ),
            //Botão para o e-mail
            buildBotoesAcoes(
              Icons.email,
              'Enviar E-mail',
              'EMAIL',
              context,
              email: email,
            ),
            const SizedBox(height: 50),

            //Telefone
            const Text(
              'Telefone:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              telefone,
              style: TextStyle(fontSize: 16),
            ),
            //Botão de ligar
            buildBotoesAcoes(
              Icons.phone,
              'Ligar',
              'LIGAR',
              context,
              telefone: telefone,
            ),
            const SizedBox(height: 50),

            //Endereço
            const Text(
              'Endereço:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              endereco,
              style: TextStyle(fontSize: 16),
            ),
            //Botão para o mapa
            buildBotoesAcoes(
              Icons.map,
              'Ver no mapa',
              'ROTA',
              context,
              endereco: endereco,
            ),
            const SizedBox(height: 24),
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/tela_base.dart';

//Tela com informações sobre a Explore Mundo
class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TelaBase(
      //Título na AppBar
      titulo: 'Sobre nós',
      //Corpo da tela
      corpo: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '🌍 Explore Mundo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Agência de Viagens',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 50),
            Text(
              'Missão:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '     Transformar seus sonhos de viagem em experiências inesquecíveis, '
              'combinando tecnologia, atendimento personalizado e um cuidado especial aos '
              'detalhes para oferecer os melhores pacotes, destinos e serviços. ',
              softWrap: true,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 18),
            Text(
              'Visão:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '     Ser referência em turismo digital, conectando pessoas aos lugares mais incríveis do mundo.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 18),
            Text(
              'Valores:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '• Compromisso com o cliente\n'
              '• Ética e transparência\n'
              '• Qualidade nos serviços\n'
              '• Paixão por viagens\n'
              '• Inovação constante',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Entre em contato conosco e descubra como podemos te levar para sua próxima aventura!',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
          ],
        ),
      )
    );
  }
}
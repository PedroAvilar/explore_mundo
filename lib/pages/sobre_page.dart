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
      corpo: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(

          children: const [
            Text(
              '🌍 Explore Mundo - Agência de Viagens',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Missão:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Transformar seus sonhos de viagem em experiências inesquecíveis. '
              'Combinamos tecnologia, atendimento personalizado e um cuidado especial aos '
              'detalhes para oferecer os melhores pacotes, destinos e serviços. ',
              softWrap: true,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Visão:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Ser referência em turismo digital, conectando pessoas aos lugares mais incríveis do mundo.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Valores:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '''
• Compromisso com o cliente
• Ética e transparência
• Qualidade nos serviços
• Paixão por viagens
• Inovação constante
              ''',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Entre em contato conosco e descubra como podemos te levar para sua próxima aventura!',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      )
    );
  }
}
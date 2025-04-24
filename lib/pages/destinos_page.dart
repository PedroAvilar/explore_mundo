import 'package:explore_mundo/model/dados_destinos.dart';
import 'package:explore_mundo/utils/media_avaliacoes.dart';
import 'package:explore_mundo/widgets/menu_navegacao.dart';
import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/estrela_media.dart';

class DestinosPage extends StatelessWidget {
  const DestinosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos'),
      ),
      drawer: MenuNavegacao(
        aoSelecionar: (rota) {
          if (ModalRoute.of(context)?.settings.name != rota) {
            Navigator.pushNamed(context, rota);
          }
        },
      ),
      body: ListView.builder(
        itemCount: destinos.length,
        itemBuilder: (context, index) {
          final destino = destinos[index];
          final mediaEstrelas = calcularMediaAvaliacoes(destino.avaliacoes);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    destino.imagem,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        destino.nome,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      EstrelaMedia(media: mediaEstrelas),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

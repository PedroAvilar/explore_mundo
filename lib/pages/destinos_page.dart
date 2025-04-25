import 'package:explore_mundo/model/dados_destinos.dart';
import 'package:explore_mundo/pages/destino_detalhes_page.dart';
import 'package:explore_mundo/utils/media_avaliacoes.dart';
import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/estrela_media.dart';

//Tela que lista os destinos
class DestinosPage extends StatelessWidget {
  const DestinosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TelaBase(
      //Título na AppBar
      titulo: 'Destinos',
      //Corpo da tela
      corpo: ListView.builder(
        itemCount: destinos.length,
        itemBuilder: (context, index) {
          final destino = destinos[index];
          final mediaEstrelas = calcularMediaAvaliacoes(destino.avaliacoes);

          //Cartão visual para cada destino
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DestinoDetalhesPage(destino: destino),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Imagem do destino
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      destino.imagem,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Nome do destino e média das estrelas abaixo da imagem
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Nome do destino alinhado à esquerda
                        Expanded(
                          child: Text(
                            destino.nome,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Média das avaliações alinhada à direita
                        EstrelaMedia(media: mediaEstrelas),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:explore_mundo/model/dados_pacotes.dart';
import 'package:explore_mundo/utils/media_avaliacoes.dart';
import 'package:explore_mundo/widgets/estrela_media.dart';
import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:flutter/material.dart';

//Tela que lista os pacotes
class PacotesPage extends StatelessWidget {
  const PacotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TelaBase(
      //Título na AppBar
      titulo: 'Pacotes de viagem',
      //Corpo da tela
      corpo: ListView.builder(
        itemCount: listaPacotes.length,
        itemBuilder: (context, index) {
          final pacote = listaPacotes[index];
          final mediaEstrelas = calcularMediaAvaliacoes(pacote.avaliacoes);

          //Cartão visual para cada pacote
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              //Ao clicar no cartão
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PacoteDetalhesPage(pacote: pacote),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Imagem do pacote
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      pacote.imagem,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  //Informações do pacote
                  ListTile(
                    //Nome
                    title: Text(
                      pacote.nome,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    //Preço e dias do pacote
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('R\$ ${pacote.preco.toStringAsFixed(2)} • ${pacote.duracaoDias} dias'),
                        const SizedBox(height: 4,),
                        // Média das avaliações
                        Row(
                          children: [EstrelaMedia(media: mediaEstrelas)],
                        )
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
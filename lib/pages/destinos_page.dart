import 'package:explore_mundo/model/dados_destinos.dart';
import 'package:explore_mundo/pages/destino_detalhes_page.dart';
import 'package:explore_mundo/utils/media_avaliacoes.dart';
import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/estrela_media.dart';
import 'package:explore_mundo/widgets/barra_de_busca.dart';

//Tela que lista os destinos
class DestinosPage extends StatefulWidget {
  const DestinosPage({super.key});

  @override
  State<DestinosPage> createState() => _DestinosPageState();
}

//Estado da tela para interações dinâmicas
class _DestinosPageState extends State<DestinosPage> {
  String _filtro = '';

  @override
  Widget build(BuildContext context) {
    //Filtra destinos conforme o texto de busca
    final destinosFiltrados = destinos.where((destino) {
      final textoBusca = _filtro.toLowerCase();
      return destino.nome.toLowerCase().contains(textoBusca) ||
        destino.descricao.toLowerCase().contains(textoBusca) ||
        destino.endereco.toLowerCase().contains(textoBusca);
    }).toList();

    return TelaBase(
      //Título na AppBar
      titulo: 'Destinos',
      //Corpo da tela
      corpo: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: BarraDeBuscaFixa(
              onChanged: (valor) {
                setState(() {
                  _filtro = valor;
                });
              },
            ),
          ),
          destinosFiltrados.isEmpty
          ? SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: const [
                      Icon(Icons.search_off, size: 48, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'Nenhum destino encontrado.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final destino = destinosFiltrados[index];
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
                        //Nome do destino e média das estrelas abaixo da imagem
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Nome do destino alinhado à esquerda
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
                              //Média das avaliações
                              EstrelaMedia(media: mediaEstrelas),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: destinosFiltrados.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
        ],
      ),
    );
  }
}
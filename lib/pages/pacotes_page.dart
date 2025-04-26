import 'package:explore_mundo/model/dados_pacotes.dart';
import 'package:explore_mundo/utils/media_avaliacoes.dart';
import 'package:explore_mundo/widgets/estrela_media.dart';
import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:flutter/material.dart';
import 'package:explore_mundo/pages/pacote_detalhes_page.dart';
import 'package:explore_mundo/widgets/barra_de_busca.dart';

//Tela que lista os pacotes
class PacotesPage extends StatefulWidget {
  const PacotesPage({super.key});

  @override
  State<PacotesPage> createState() => _PacotesPageState();
}

//Estado da tela para interações dinâmicas
class _PacotesPageState extends State<PacotesPage> {
  String _filtro = '';

  @override
  Widget build(BuildContext context) {
    //Filtra pacotes conforme o texto de busca
    final pacotesFiltrados = listaPacotes.where((pacote) {
      final textoBusca = _filtro.toLowerCase();
      return pacote.nome.toLowerCase().contains(textoBusca) ||
        pacote.descricao.toLowerCase().contains(textoBusca) ||
        pacote.destinos.any((destino) => destino.toLowerCase().contains(textoBusca));
    }).toList();

    return TelaBase(
      //Título na AppBar
      titulo: 'Pacotes de viagem',
      //Corpo da tela
      corpo: CustomScrollView(
        slivers: [
          //Campo de busca
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
          //Caso a lista de pacotes filtrados esteja vazia
          pacotesFiltrados.isEmpty
          ? SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: const [
                      Icon(Icons.search_off, size: 48, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'Nenhum pacote encontrado.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
          //Lista de pacotes filtrados
          : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final pacote = pacotesFiltrados[index];
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
                              Text('${pacote.duracaoDias} dias • R\$ ${pacote.preco.toStringAsFixed(2)}'),
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
              childCount: pacotesFiltrados.length,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:explore_mundo/model/avaliacao.dart';
import 'package:explore_mundo/model/destino.dart';
import 'package:explore_mundo/utils/media_avaliacoes.dart';
import 'package:explore_mundo/widgets/avaliacao_widget.dart';
import 'package:explore_mundo/widgets/estrela_media.dart';
import 'package:explore_mundo/widgets/formulario_avaliacao.dart';
import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/botoes_acoes.dart';

//Tela que exibe os detalhes completos de um destino
class DestinoDetalhesPage extends StatefulWidget {
  //Destino que será exibido
  final Destino destino;

  const DestinoDetalhesPage({super.key, required this.destino});

  @override
  State<DestinoDetalhesPage> createState() => _DestinoDetalhesPageState();
}

//Estado da tela para interações dinâmicas
class _DestinoDetalhesPageState extends State<DestinoDetalhesPage> {
  late List<Avaliacao> _avaliacoes;

  @override
  void initState() {
    super.initState();
    _avaliacoes = List.from(widget.destino.avaliacoes);
  }

  //Função chamada quando uma nova avaliação é enviada pelo formulário
  void _adicionarAvaliacao(String nome, int estrelas, String comentario) {
    setState(() {
      _avaliacoes.add(
        Avaliacao(
          nome: nome,
          estrelas: estrelas,
          comentario: comentario,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //Calcula a média de estrelas com base nas avaliações atuais
    final mediaEstrelas = calcularMediaAvaliacoes(_avaliacoes);

    return TelaBase(
      //Título na AppBar
      titulo: widget.destino.nome,
      //Corpo da tela
      corpo: ListView(
        children: [
          //Imagem do destino
          Image.asset(
            widget.destino.imagem,
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
          //Nome do destino e média de estrelas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.destino.nome,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                EstrelaMedia(media: mediaEstrelas),
              ],
            ),
          ),
          //Botões de ação
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildButtonColumn(
                  Icons.call,
                  'LIGAR',
                  'LIGAR',
                  context,
                  telefone: widget.destino.telefone),
                buildButtonColumn(
                  Icons.near_me,
                  'ROTA',
                  'ROTA',
                  context,
                  endereco: widget.destino.endereco),
                buildButtonColumn(
                  Icons.share,
                  'COMPARTILHAR',
                  'COMPARTILHAR',
                  context,
                  nome: widget.destino.nome,
                  telefone: widget.destino.telefone,
                  endereco: widget.destino.endereco,
                  mediaEstrelas: mediaEstrelas),
              ],
            ),
          ),
          //Descrição do destino
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              widget.destino.descricao,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
          //Formulário para adicionar nova avaliação
          FormularioAvaliacao(onEnviar: _adicionarAvaliacao),
          const SizedBox(height: 8),
          //Exibição das avaliações
          ..._avaliacoes.reversed.map((a) => AvaliacaoWidget(
            nomeCliente: a.nome,
            estrelas: a.estrelas,
            comentario: a.comentario,
          )),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

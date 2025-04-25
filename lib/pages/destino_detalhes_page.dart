import 'package:explore_mundo/model/avaliacao.dart';
import 'package:explore_mundo/model/destino.dart';
import 'package:explore_mundo/utils/media_avaliacoes.dart';
import 'package:explore_mundo/widgets/avaliacao_widget.dart';
import 'package:explore_mundo/widgets/estrela_media.dart';
import 'package:explore_mundo/widgets/formulario_avaliacao.dart';
import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:flutter/material.dart';
import 'package:explore_mundo/widgets/botoes_destinos.dart';

class DestinoDetalhesPage extends StatefulWidget {
  final  Destino destino;

  const DestinoDetalhesPage({super.key, required this.destino});

  @override
  State<DestinoDetalhesPage> createState() => _DestinoDetalhesPageState();
}

class _DestinoDetalhesPageState extends State<DestinoDetalhesPage> {
  late List<Avaliacao> _avaliacoes;

  @override
  void initState() {
    super.initState();
    _avaliacoes = List.from(widget.destino.avaliacoes);
  }

  void _adicionarAvaliacao(String nome, int estrelas, String comentario) {
    setState(() {
      _avaliacoes.add(
        Avaliacao(
          nome: nome,
          estrelas: estrelas,
          comentario: comentario
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaEstrelas = calcularMediaAvaliacoes(_avaliacoes);

    return TelaBase(
      titulo: widget.destino.nome,
      corpo: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                widget.destino.imagem,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                left: 12,
                right: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.destino.nome,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                        ),
                      ),
                    ),
                    EstrelaMedia(media: mediaEstrelas),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildButtonColumn(Colors.blue, Icons.call, 'LIGAR', 'LIGAR'),
                buildButtonColumn(Colors.blue, Icons.near_me, 'ROTA', 'ROTA'),
                buildButtonColumn(Colors.blue, Icons.share, 'COMPARTILHAR', 'COMPARTILHAR'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              widget.destino.descricao,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
          FormularioAvaliacao(onEnviar: _adicionarAvaliacao),
          const SizedBox(height: 8),
          ..._avaliacoes.reversed.map((a) => AvaliacaoWidget(
            nomeCliente: a.nome,
            estrelas: a.estrelas,
            comentario: a.comentario
          )),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
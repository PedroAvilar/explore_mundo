import 'package:explore_mundo/widgets/estrela_media.dart';
import 'package:flutter/material.dart';
import 'package:explore_mundo/model/pacote.dart';
import 'package:explore_mundo/model/avaliacao.dart';
import 'package:explore_mundo/widgets/tela_base.dart';
import 'package:explore_mundo/utils/media_avaliacoes.dart';
import 'package:explore_mundo/widgets/avaliacao_widget.dart';
import 'package:explore_mundo/widgets/formulario_avaliacao.dart';

//Tela que exibe os detalhes completos de um pacote
class PacoteDetalhesPage extends StatefulWidget{
  //Pacote que será exibido
  final PacoteViagem pacote;

  const PacoteDetalhesPage({super.key, required this.pacote});

  @override
  State<PacoteDetalhesPage> createState() => _PacoteDetalhesPageState();
}

//Estado da tela para interações dinâmicas
class _PacoteDetalhesPageState extends State<PacoteDetalhesPage> {
  late List<Avaliacao> _avaliacoes;

  @override
  void initState() {
    super.initState();
    _avaliacoes = List.from(widget.pacote.avaliacoes);
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
      titulo: widget.pacote.nome,
      //Corpo da tela
      corpo: ListView(
        children: [
          //Imagem do pacote
          Image.asset(
            widget.pacote.imagem,
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
          //Informações do pacote
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Nome
                Text(
                  widget.pacote.nome,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                //Dias e valor do pacote
                Text(
                  '${widget.pacote.duracaoDias} dias • R\$ ${widget.pacote.preco.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                //Média das avaliações
                Row(
                  children: [EstrelaMedia(media: mediaEstrelas)],
                ),
                const SizedBox(height: 16),
                //Descrição do pacote
                Text(
                  widget.pacote.descricao,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),

                //Botão de reserva
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Reservar agora'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Reserva realizada com sucesso!'),
                        ),
                      );
                    },
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
          ),
        ],
      ),
    );
  }       
}
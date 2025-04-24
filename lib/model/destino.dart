import 'avaliacao.dart';

//Modelo de destino
class Destino {
  final String nome;
  final String imagem;
  final List<Avaliacao> avaliacoes;

  Destino({
    required this.nome,
    required this.imagem,
    required this.avaliacoes,
  });
}
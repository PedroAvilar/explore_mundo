import 'avaliacao.dart';

//Modelo de destino
class Destino {
  final String nome;
  final String imagem;
  final String descricao;
  final String telefone;
  final String endereco;
  final List<Avaliacao> avaliacoes;

  Destino({
    required this.nome,
    required this.imagem,
    required this.descricao,
    required this.telefone,
    required this.endereco,
    required this.avaliacoes,
  });
}
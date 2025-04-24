import '../model/destino.dart';
import '../model/avaliacao.dart';

//Lista dos destinos com dados
final List<Destino> destinos = [
  Destino(
    nome: 'Oeschinen Lake',
    imagem: 'assets/imagens_lugares/oeschinen-lake.jpg',
    avaliacoes: [
      Avaliacao(
        nome: 'Pedro Avilar',
        estrelas: 5,
        comentario: 'Paisagens de tirar o fôlego. Experiência inesquecível.'
      ),
      Avaliacao(
        nome: 'Claudio Pontes',
        estrelas: 4,
        comentario: 'Excelente para relaxar e curtir a família, não recomendo em dias frios.'
      ),
    ],
  ),
  Destino(
    nome: 'Lauterbrunnen',
    imagem: 'assets/imagens_lugares/lauterbrunnen.jpg',
    avaliacoes: [
      Avaliacao(
        nome: 'Jane Anne',
        estrelas: 3,
        comentario: 'Muito bonito, mas o acesso é um pouco difícil.'
      ),
      Avaliacao(
        nome: 'Luci Avilar',
        estrelas: 5,
        comentario: 'Lugar incrível. Adorei cada segundo no lugar.'
      ),
    ],
  ),
  Destino(
    nome: 'Zermatt',
    imagem: 'assets/imagens_lugares/zermatt.jpg',
    avaliacoes: [
      Avaliacao(
        nome: 'Toddy Bear',
        estrelas: 5,
        comentario: 'Melhor experiência que já tive, lugar acolhedor com muitas opções de lazer.'
      ),
      Avaliacao(
        nome: 'Clara White',
        estrelas: 5,
        comentario: 'Cidade maravilhosa. A vista das montanhas e o pôr do sol são incríveis.'
      ),
    ],
  ),
];
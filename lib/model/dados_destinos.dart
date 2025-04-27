import '../model/destino.dart';
import '../model/avaliacao.dart';

//Lista dos destinos com dados
final List<Destino> destinos = [

  Destino(
    nome: 'Oeschinen Lake',
    imagem: 'assets/imagens_lugares/oeschinen-lake.jpg',
    descricao: '''
      Oeschinen Lake, é um verdadeiro paraíso natural que merece estar no topo da sua lista de viagens.
      Com águas azul-turquesa cercadas por montanhas imponentes, este lago oferece um cenário de tirar o fôlego em qualquer estação do ano. No verão, o clima ameno convida para atividades como trilhas panorâmicas, passeios de barco e até mesmo um mergulho refrescante. Já no inverno, a paisagem se transforma em um espetáculo de neve, perfeito para caminhadas e pesca no gelo.
      Para quem busca adrenalina, há um tobogã alpino que proporciona diversão com vistas incríveis. a região conta com restaurantes aconchegantes onde você pode saborear pratos típicos suíços enquanto aprecia a vista. O acesso ao lago é facilitado por um teleférico, tornando a experiência ainda mais especial.
      Se você procura um destino que combina aventura, tranquilidade e beleza natural, Oeschinen Lake é a escolha perfeita!
      ''',
    telefone: '+41 33 844 33 33',
    endereco: 'Oeschinen Lake, Kandersteg, Suíça',
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
    descricao: '''
      Lauterbrunnen é um destino que parece saído de um conto de fadas.
      Localizado em um vale cercado por penhascos imponentes, este vilarejo suíço encanta com suas 72 cachoeiras, montanhas majestosas e atmosfera ranquila.
      No verão, o clima agradável convida para caminhadas panorâmicas, passeios de bicicleta e visitas às cachoeiras, que estão em seu auge. No inverno, Lauterbrunnen se transforma em um paraíso alpino, perfeito para esportes na neve e momentos de contemplação.
      A vila também serve como ponto de partida para explorar Jungfraujoch, conhecido como o "Topo da Europa".
      Além das paisagens deslumbrantes, Lauterbrunnen oferece aconchegantes cafés e restaurantes onde você pode saborear pratos típicos suíços enquanto aprecia a vista.
      O acesso é fácil, seja de trem ou carro, tornando a viagem ainda mais especial.
      Se você busca um destino que combina aventura, tranquilidade e beleza natural, Lauterbrunnen é uma escolha inesquecível!
      ''',
    telefone: '+41 33 855 44 44',
    endereco: 'Lauterbrunnen, Suiça',
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
    descricao: '''
      Zermatt é uma vila encantadora nos Alpes Suíços, reconhecida por sua proximidade ao icônico Matterhorn, uma das montanhas mais famosas do mundo.
      Além das vistas deslumbrantes, Zermatt é conhecida por ser uma cidade livre de carros, o que proporciona um ambiente tranquilo para explorar a pé ou usando transportes elétricos.
      Entre suas principais atrações estão o Matterhorn Glacier Paradise, que é o ponto mais alto da Europa acessível por teleférico, e o Gornergrat Railway, um passeio de trem que oferece panoramas impressionantes das montanhas. A região também conta com museus para os interessados em história e alpinismo, como o Museu Matterhorn, além de áreas como Sunnegga, perfeitas para relaxar e contemplar a paisagem.
      Seja no inverno para esquiar ou no verão para fazer trilhas, Zermatt oferece experiências únicas em todas as estações.
      ''',
    telefone: '+41 27 866 55 55',
    endereco: 'Zermatt, Suíça',
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
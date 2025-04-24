import 'package:explore_mundo/model/avaliacao.dart';
import 'package:flutter/material.dart';
import 'widgets/avaliacao_widget.dart';
import 'widgets/formulario_avaliacao.dart';
import 'utils/media_avaliacoes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Avaliacao> _avaliacoes = [
    Avaliacao(
      nome: 'Pedro Avilar',
      estrelas: 5,
      comentario: 'Paisagens de tirar o fôlego. Experiência inesquecível.',
    ),
    Avaliacao(
      nome: 'Claudio Pontes', 
      estrelas: 4,
      comentario: 'Excelente para relaxar e curtir a família, não recomendo no inverno.'
    ),
    Avaliacao(
      nome: 'Jane Anne',
      estrelas: 3,
      comentario: 'Muito bonito, mas o acesso é um pouco difícil.'
    ),
  ];

  void _adicionarAvaliacao(String nome, int estrelas, String comentario) {
      setState(() {
        _avaliacoes.add(
          Avaliacao(
            nome: nome,
            estrelas: estrelas,
            comentario: comentario
          ),
        );
      });
    }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleSection (double media) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(media.toStringAsFixed(1)),
        ],
      ),
    );
  }

  final Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'O Lago Oeschinen fica aos pés do Blüemlisalp nos Alpes Berneses. '
      'Situado a 1.578 metros acima do nível do mar, '
      'é um dos lagos alpinos mais amplos. '
      'Um passeio de teleférico a partir de Kandersteg, seguido '
      'por meia hora de caminhada por pastagens e floresta '
      'de pinheiros, leva você ao lago, que aquece até 20 '
      'graus Celsius no verão. As atividades desfrutadas aqui '
      'incluem remo e andar no tobogã de verão.',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {

    final Color color = Theme.of(context).primaryColor;
    final double mediaEstrelas = calcularMediaAvaliacoes(_avaliacoes);

    final Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'LIGAR'),
        _buildButtonColumn(color, Icons.near_me, 'ROTA'),
        _buildButtonColumn(color, Icons.share, 'COMPARTILHAR'),
      ],
    );

    return MaterialApp(
      title: 'Demonstração de layout Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demonstração de layout Flutter'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/imagens_lugares/oeschinen-lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            _buildTitleSection(mediaEstrelas),
            buttonSection,
            textSection,
            FormularioAvaliacao(onEnviar: _adicionarAvaliacao),
            ..._avaliacoes.map((a) => AvaliacaoWidget(
              nomeCliente: a.nome,
              estrelas: a.estrelas,
              comentario: a.comentario
            )),
          ],
        ),
      ),
    );
  }
}
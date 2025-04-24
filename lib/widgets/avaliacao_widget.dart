import 'package:flutter/material.dart';

class AvaliacaoWidget extends StatelessWidget {
  final String nomeCliente;
  final int estrelas;
  final String comentario;

  const AvaliacaoWidget({
    super.key,
    required this.nomeCliente,
    required this.estrelas,
    required this.comentario,
  });

  List<Widget> _buildEstrelas(int estrelas) {
    return List.generate(5, (index) {
      if (index < estrelas) {
        return const Icon(Icons.star, color: Colors.amber, size: 18);
      } else {
        return const Icon(Icons.star, color: Colors.grey, size: 18);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nomeCliente,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              children: _buildEstrelas(estrelas),
            ),
            const SizedBox(height: 8),
            Text(comentario),
          ],
        ),
      ),
    );
  }
}
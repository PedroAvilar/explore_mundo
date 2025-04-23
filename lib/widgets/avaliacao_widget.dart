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

  Widget _buildEstrelas(int count) {
    return Row(
      children: List.generate(5, (index) {
        if (index < count) {
          return const Icon(Icons.star_border, color: Colors.amber, size: 16);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey, size: 16);
        }
      }),
    );
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
            const SizedBox(height: 4),
            _buildEstrelas(estrelas),
            const SizedBox(height: 8),
            Text(comentario),
          ],
        ),
      ),
    );
  }
}
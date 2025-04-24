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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nomeCliente,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: List.generate(
                    estrelas,
                    (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              comentario,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

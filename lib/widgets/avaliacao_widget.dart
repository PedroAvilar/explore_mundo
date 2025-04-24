import 'package:flutter/material.dart';

//Widget que representa uma avaliação de cliente
class AvaliacaoWidget extends StatelessWidget {
  final String nomeCliente;
  final int estrelas;
  final String comentario;

  //Construtor da class
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
                //Nome do cliente na avaliação
                Text(
                  nomeCliente,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                //Ícones de estrelas amarelas
                Row(
                  children: List.generate(
                    estrelas,
                    (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            //Texto do comentário
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

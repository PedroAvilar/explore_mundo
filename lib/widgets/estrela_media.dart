import 'package:flutter/material.dart';

//Widget do ícone da média das avaliações
class EstrelaMedia extends StatelessWidget {
  final double media;

  const EstrelaMedia({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 22),
        const SizedBox(width: 4),
        Text(
          media.toStringAsFixed(1),
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
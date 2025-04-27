import 'package:flutter/material.dart';

//Widget para campo de busca
class BarraDeBuscaFixa extends SliverPersistentHeaderDelegate {
  final ValueChanged<String> onChanged;

  BarraDeBuscaFixa({required this.onChanged});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color.fromARGB(255, 140, 220, 255),
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Pesquisar',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
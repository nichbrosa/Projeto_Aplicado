import 'package:flutter/material.dart';
import 'package:projeto_aplicado/paginas/carrinho_pagina.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  final bool isScroller;

  const MySliverAppBar({
    super.key, 
    required this.child,
    required this.title, 
    this.isScroller = false, // Definindo o valor padrão como false
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: isScroller,
      pinned: !isScroller,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Die Menüs"),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Navegar para a página do carrinho
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const CarrinhoPagina(), 
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size(0),
        child: Divider(
          indent: 25,
          endIndent: 25,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}

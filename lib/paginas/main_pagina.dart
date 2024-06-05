import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_aplicado/componentes/my_drawer.dart';
import 'package:projeto_aplicado/paginas/restaurante_pagina.dart';
import 'package:projeto_aplicado/paginas/restaurante2_pagina.dart';
import 'package:projeto_aplicado/componentes/my_sliver_app_bar.dart';

class MainPagina extends StatefulWidget {
  const MainPagina({super.key});

  @override
  State<MainPagina> createState() => _MainPaginaState();
}

class _MainPaginaState extends State<MainPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          const MySliverAppBar(
            title: Text(''),
            isScroller: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.food_bank_outlined,
                  size: 150,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 20),

                _buildCard(
                  imageUrl: 'lib/imagens/comidas/MINI_PASTEL.png',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RestaurantePagina(),
                    ),
                  ),
                  text: 'Restaurante 1',
                ),
                const SizedBox(height: 20),
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                _buildCard(
                  imageUrl: 'lib/imagens/comidas/BURGÃO.png',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Restaurante2Pagina(),
                    ),
                  ),
                  text: 'Restaurante 2',
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String imageUrl,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

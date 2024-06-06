import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_current_location.dart';
import 'package:projeto_aplicado/componentes/my_description_box.dart';
import 'package:projeto_aplicado/componentes/my_drawer.dart';
import 'package:projeto_aplicado/componentes/my_food_tile.dart';
import 'package:projeto_aplicado/componentes/my_sliver_app_bar.dart';
import 'package:projeto_aplicado/componentes/my_tab_bar.dart';
import 'package:projeto_aplicado/modelos/comida.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:projeto_aplicado/paginas/comida_pagina.dart';
import 'package:provider/provider.dart';

class RestaurantePagina extends StatefulWidget {
  const RestaurantePagina({super.key});

  @override
  State<RestaurantePagina> createState() => _RestaurantePaginaState();
}

class _RestaurantePaginaState extends State<RestaurantePagina>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: CategoriaComida.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // separar e retornar uma lista dos itens de comida que pertencem a uma categoria especifica
  List<Comida> _filtrarMenuPorCategoria(
      CategoriaComida categoria, List<Comida> fullMenu) {
    return fullMenu.where((Comida) => Comida.categoria == categoria).toList();
  }

  // retornar a lista de comidas na categoria fornecida
  List<Widget> getFoodInThisCategory(List<Comida> fullMenu) {
    return CategoriaComida.values.map((categoria) {
      // pega a categoria da comida
      List<Comida> categoryMenu = _filtrarMenuPorCategoria(categoria, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // pega a comida individualmente
          final comida = categoryMenu[index];

          //retorna os blocos de UI da comida
          return FoodTile(
            comida: comida,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComidaPagina(comida: comida),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            isScroller: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               

                //caixa de descrição
                const MyDescriptionBox(),

                //nome do restaurante
                const Text(
                    "Just Burgers",
                      style: TextStyle(
                        fontSize: 16, // Tamanho da fonte
                        fontWeight: FontWeight.bold, // Negrito
  ),
),

                //localização atual
                MyCurrentLocation(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurante>(
          builder: (context, restaurante, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurante.menu),
          ),
        ),
      ),
    );
  }
}

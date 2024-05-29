import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/comida.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
    });

    List<Tab> _buildCategoryTabs(){
      return CategoriaComida.values.map((categoria){
        return Tab(
          text: categoria.toString().split('.').last,
        );
      }).toList();
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
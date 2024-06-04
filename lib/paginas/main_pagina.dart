
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

class MainPagina extends StatefulWidget {
  const MainPagina({super.key});

  @override
  State<MainPagina> createState() => _MainPaginaState();
}

class _MainPaginaState extends State<MainPagina> with SingleTickerProviderStateMixin{
   
  //tab controller
  late TabController _tabController;



@override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          MySliverAppBar(
            title: Text("Ola"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [  
                Container(
                  
                ),            
                Divider(
                  indent: 25, 
                  endIndent: 25, 
                  color: Theme.of(context).colorScheme.secondary,
                  ),

               


               ],
              ),
          ),
        ], body: const Column(),
       
        ),
      );
  }
}
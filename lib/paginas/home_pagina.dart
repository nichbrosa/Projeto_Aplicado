
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_current_location.dart';
import 'package:projeto_aplicado/componentes/my_description_box.dart';
import 'package:projeto_aplicado/componentes/my_drawer.dart';
import 'package:projeto_aplicado/componentes/my_sliver_app_bar.dart';
import 'package:projeto_aplicado/componentes/my_tab_bar.dart';

class HomePagina extends StatefulWidget {
  const HomePagina({super.key});

  @override
  State<HomePagina> createState() => _HomePaginaState();
}

class _HomePaginaState extends State<HomePagina> with SingleTickerProviderStateMixin{
   
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

@override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [              
                Divider(
                  indent: 25, 
                  endIndent: 25, 
                  color: Theme.of(context).colorScheme.secondary,
                  ),

                //localização atual
                const MyCurrentLocation(),

                //caixa de descrição
                const MyDescriptionBox(),
               ],
              ),
          ),
        ],
        body: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const Text("Home"),
              ),
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const Text("Configurações"),
              ),
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const Text("Usuários"),
              ),
            ],
          ),
        ),
      );
  }
}
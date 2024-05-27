import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_drawer.dart';

class HomePagina extends StatefulWidget {
  const HomePagina({super.key});

  @override
  State<HomePagina> createState() => _HomePaginaState();
}

class _HomePaginaState extends State<HomePagina>{
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      drawer: MyDrawer(),
    );
  }
}
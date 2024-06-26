import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_drawer_tile.dart';
import 'package:projeto_aplicado/paginas/config_pagina.dart';
import 'package:projeto_aplicado/paginas/main_pagina.dart';
import 'package:projeto_aplicado/servicos/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
          child: Icon(
            Icons.food_bank_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
               color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //lista de title home
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home_outlined,
            onTap: (){ 
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPagina(),
                  ),
                );
              },
            ),

          //settings list title
          MyDrawerTile(
            text: "C O N F I G U R A Ç Õ E S",
            icon: Icons.settings_outlined,
            onTap: (){ 
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfigPagina(),
                  ),
                );
              },
            ),

          const Spacer(),

          //logout list title
          MyDrawerTile(
            text: "D E S L O G A R",
            icon: Icons.logout_outlined,
            onTap: () {
              logout();
              Navigator.pop(context);
              },
            ),

            const SizedBox(height: 25),
        ],
        ),
    );
  }
}
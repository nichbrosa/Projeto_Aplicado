

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/paginas/main_pagina.dart';
import 'package:projeto_aplicado/servicos/auth/auth_gate.dart';
import 'package:projeto_aplicado/firebase_options.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:projeto_aplicado/temas/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(
      MultiProvider(providers: [
        //provedor de tema
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //provedor de restaurante
        ChangeNotifierProvider(create: (context) => Restaurante()),
        ],
        child: const MyApp(),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
    Widget build(BuildContext context){
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

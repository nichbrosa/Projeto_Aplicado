import 'package:flutter/material.dart';
import 'package:projeto_aplicado/auth/login_ou_registrar.dart';
import 'package:projeto_aplicado/temas/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
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
      home:  const LoginOuRegistro(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

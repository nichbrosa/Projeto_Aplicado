import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/restaurante2.dart';
import 'package:projeto_aplicado/servicos/auth/auth_gate.dart';
import 'package:projeto_aplicado/firebase_options.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:projeto_aplicado/temas/modo_gluten.dart';
import 'package:projeto_aplicado/temas/modo_leite.dart';
import 'package:projeto_aplicado/temas/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        //provedor de tema
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //provedor de restaurante1
        ChangeNotifierProvider(create: (context) => Restaurante()),
        //provedor de restaurante2
        ChangeNotifierProvider(create: (context) => Restaurante2()),
        //provedor de gluten
        ChangeNotifierProvider(create: (context) => Gluten()),
        //provedor de leite
        ChangeNotifierProvider(create: (context) => Leite()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

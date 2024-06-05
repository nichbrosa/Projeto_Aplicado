import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/paginas/main_pagina.dart';
import 'package:projeto_aplicado/paginas/restaurante_pagina.dart';
import 'package:projeto_aplicado/servicos/auth/login_ou_registrar.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          //usuario esta logado
          if(snapshot.hasData){
            return const MainPagina();
          }

          //usuario não está logado
          else{
            return const LoginOuRegistro();
          }
        },
      ),
    );
  }
}
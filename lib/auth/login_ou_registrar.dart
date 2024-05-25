import 'package:flutter/material.dart';
import 'package:projeto_aplicado/paginas/login_pagina.dart';
import 'package:projeto_aplicado/paginas/registro_pagina.dart';


class LoginOuRegistro extends StatefulWidget{
  const LoginOuRegistro({super.key});

  @override
  State<LoginOuRegistro> createState() => _LoginOuRegistroState();
}

class _LoginOuRegistroState extends State<LoginOuRegistro> {

  // mostrar primeiro login
  bool showLoginPagina = true;

  //trocar entre pagina de login e registro
  void togglePaginas(){
    setState((){
      showLoginPagina = !showLoginPagina;
    });
  }

  @override
  Widget build(BuildContext context){
    if(showLoginPagina){
      return LoginPagina(onTap: togglePaginas);
    }else {
      return RegistroPagina(onTap: togglePaginas);
    }
  }
}
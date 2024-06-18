// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_button.dart';
import 'package:projeto_aplicado/componentes/my_textfield.dart';
import 'package:projeto_aplicado/servicos/auth/auth_service.dart';

class LoginPagina extends StatefulWidget {
  final void Function()? onTap;

  const LoginPagina({super.key, required this.onTap});

  @override
  State<LoginPagina> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPagina> {
  // controller do editor de texto
  final TextEditingController emailController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

  //metodo login
  void login() async {
    //get instancia do auth service
    final authService = AuthService();

    //tentar sign in
    if (emailController.text.isNotEmpty && senhaController.text.isNotEmpty) {
      try {
        await authService.signInWithEmailPassword(
            emailController.text, senhaController.text);
      }

      //mostrar mensagem de erro
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
  //se o e-mail estiver vazio -> mostrar error
    else if (emailController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("E-mail não preenchido"),
        ),
      );
    }
  //se a senha estiver vazio -> mostrar error
    else if (senhaController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Senha não preenchida"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.food_bank_outlined,
              size: 150,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 10),
            //mensagem

            Column(
              children: [
                Text("Die Menüs",
                    style: TextStyle(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
              ],
            ),

            const SizedBox(height: 25),
            //textfield email
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(height: 10),

            //textfield senha
            MyTextField(
                controller: senhaController,
                hintText: "Senha",
                obscureText: true),

            const SizedBox(height: 10),

            //botão login
            MyButton(
              text: "Login",
              onTap: login,
            ),

            const SizedBox(height: 25),

            //registrar-se
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Não tem uma conta? ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Registre-se",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

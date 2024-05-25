import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_button.dart';
import 'package:projeto_aplicado/componentes/my_textfield.dart';

class RegistroPagina  extends StatefulWidget{
  final void Function()? onTap;

  const RegistroPagina({super.key, required this.onTap});

  @override
  State<RegistroPagina> createState() => _RegistroPaginaState();
}

  class _RegistroPaginaState extends State<RegistroPagina>{
     // controller do editor de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarsenhaController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.email_outlined,
            size: 200,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
          

          const SizedBox(height: 10),
          //mensagem
            Text("Crie uma conta", 
            style: TextStyle(
              fontSize: 32,
              color: Theme.of(context).colorScheme.inversePrimary,
              )
            ), 

          const SizedBox(height: 25),
          //textfield email
          MyTextField(
            controller: emailController, 
            hintText: "Email", 
            obscureText: false
            ),

          const SizedBox(height: 10),
          
          //textfield senha
          MyTextField(
            controller: senhaController, 
            hintText: "Senha", 
            obscureText: true
            ),

          const SizedBox(height: 10),
          
          //textfield confirmar senha
          MyTextField(
            controller: confirmarsenhaController, 
            hintText: "Confirme a Senha", 
            obscureText: true
            ),

          const SizedBox(height: 10),

          //botão registrar
          MyButton(
            text: "Registrar",
            onTap: (){},
            ),

         const SizedBox(height: 25),

          //ja e um usuario
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ja tem uma conta? ", style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary),
              ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: widget.onTap,
           child: Text(
              "Login", style: TextStyle(
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
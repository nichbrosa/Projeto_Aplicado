import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_aplicado/componentes/my_button.dart';
import 'package:projeto_aplicado/componentes/my_cart_tile.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:projeto_aplicado/paginas/pagamento_pagina.dart';
import 'package:provider/provider.dart';

class CarrinhoPagina extends StatelessWidget {
  const CarrinhoPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurante>(builder: (context, restaurante, child){
      //carrinho
      final usuarioCarrinho = restaurante.carrinho;

      //scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: Text("Carrinho"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //botao limpar carrinho
            IconButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: const Text("Você gostaria de limpar o carrinho?"),
                    actions: [
                      //botao cancelar
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancelar"),
                      ),
                      //botao confirmar
                     TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurante.limparCarrinho();
                        },
                        child: const Text("Sim"),
                      ), 
                    ],
                  ),
                );
              }, 
              icon: const Icon(Icons.delete_outlined),
            ),
          ],
        ),
        body: Column(
          children: [

            //lista do carrinho
            Expanded(
              child: Column(
                children: [
                  usuarioCarrinho.isEmpty 
                  ?const Expanded(
                    child: Center(
                      child: Text("Carrinho está vazio.."),
                    ),
                  ) 
                  : Expanded(
                    child: ListView.builder(
                      itemCount: usuarioCarrinho.length,
                      itemBuilder: (context, index){
              
                        //get item individual do carrinho
                        final itemCarrinho = usuarioCarrinho[index];
              
                        //retorna a UI do tile carrinho
                        return MyCartTile(itemCarrinho: itemCarrinho,);
                        },
                      ),
                    ),
                  ],
                ),
            ),

            
              //botao para pagar
               MyButton(
              onTap: () {
                if (usuarioCarrinho.isEmpty) {
                  // Mostra uma mensagem de aviso se o carrinho estiver vazio
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("O carrinho está vazio. Adicione itens antes de continuar."),
                    ),
                  );
                } else {
                  // Navega para a página de pagamento se o carrinho não estiver vazio
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PagamentoPagina(),
                    ),
                  );
                }
              },
              text: "Ir para pagamento",
            ),

                const SizedBox(height: 25),
          ],
        ),
      );
    },);
  }
}
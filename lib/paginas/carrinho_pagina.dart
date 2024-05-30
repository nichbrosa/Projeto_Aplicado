import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
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
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: usuarioCarrinho.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(usuarioCarrinho[index].comida.nome),
                  ),
                ),
              ),
            ],
          ),
      );
    },);
  }
}
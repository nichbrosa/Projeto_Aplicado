import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text("Obrigado pelo seu pedido!"),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border: 
                Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(25),
            child: Consumer<Restaurante>(
              builder: (context, restaurate, child) =>  
                Text(restaurate.mostrarReciboCarrinho()),
                
              ),
            ),
            const SizedBox(height: 25),
            const Text("Entrega estimada em: 15 minutos"),
          ],
        ),
      ),
    );
  }
}
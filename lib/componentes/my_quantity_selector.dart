import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/comida.dart';

class QuantitySelector extends StatelessWidget {
  final int quantidade;
  final Comida comida;
  final VoidCallback onAumentar;
  final VoidCallback onDiminuir;


  const QuantitySelector({
      super.key,
      required this.quantidade,
      required this.comida,
      required this.onAumentar,
      required this.onDiminuir,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDiminuir,
            child: Icon(
              Icons.remove_outlined,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          //contar quantidde
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  quantidade.toString(),
                ),
              ),
            ),
          ),

          //botao incrementar
          GestureDetector(
            onTap: onAumentar,
            child: Icon(
              Icons.add_outlined,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
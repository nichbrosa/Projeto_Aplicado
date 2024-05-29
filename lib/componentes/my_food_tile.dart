import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/comida.dart';

class FoodTile extends StatelessWidget {
  final Comida comida;
  final void Function()? onTap;

  const FoodTile({
      super.key,
      required this.comida,
      required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
            
                //detalhes da comida
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(comida.nome),
                      Text('R\$' + comida.preco.toString(), 
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        comida.descricao,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(width: 15),

                //imagem da comida
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(comida.caminhoImagem, height: 120),
                  ),
              ],
            ),
          ),
        ),

        //linha divisora
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
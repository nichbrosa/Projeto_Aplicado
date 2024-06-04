import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_aplicado/componentes/my_quantity_selector.dart';
import 'package:projeto_aplicado/modelos/item_carrinho.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final ItemCarrinho itemCarrinho;
  const MyCartTile({
      super.key,
      required this.itemCarrinho,
    });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurante>(
      builder: (context, restaurante, child) => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              //imagem da comida
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  itemCarrinho.comida.caminhoImagem,
                  height: 100,
                  width: 100,
                ),
              ),
              
              const SizedBox(width: 10),
              
              //nome e preco
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nome comida
                  Text(itemCarrinho.comida.nome),
                  
              
                  //preco comida
                  Text(
                    'R\$' + itemCarrinho.comida.preco.toStringAsFixed(2),
                   style: TextStyle(
                     color: Theme.of(context).colorScheme.primary),
                  ),

                  const SizedBox(height: 10),

                   //aumentar e diminuir quantidade
                   QuantitySelector(
                     quantidade: itemCarrinho.quantidade, 
                     comida: itemCarrinho.comida, 
                       onAumentar: (){
                        restaurante.adicionarAoCarrinho(itemCarrinho.comida, itemCarrinho.complementoSelecionado);
                  }, 
                   onDiminuir: (){
                    restaurante.removerDoCarrinho(itemCarrinho);
                  }, 
                ),


                ],
              ),

              const Spacer(),
              
             
                         ],
                        ),
            ),

            //complementos
            SizedBox(
              height: itemCarrinho.complementoSelecionado.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: itemCarrinho.complementoSelecionado
                .map(
                  (complemento) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Row(
                        children: [
                          //nome do complemento
                          Text(complemento.nome),
                    
                          //preco do complemento
                          Text(' (R\$' + complemento.preco.toStringAsFixed(2) + ') '
                          ),
                        ],
                      ), 
                      shape: StadiumBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary)
                      ),
                        onSelected: (value){},
                        backgroundColor: 
                          Theme.of(context).colorScheme.secondary,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12,
                        ),
                      ),
                  ),
                  )
                  .toList(),
                ),  
              ),
            
          ],
        ),
      ),
    );
  }
}
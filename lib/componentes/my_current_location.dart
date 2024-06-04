import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();


  void openLocationSearchBox(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Sua localização"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Adicione o endereço .."),
        ),
        actions: [
          //botão cancelar
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },       
            child: const Text('Cancelar'),  
          ),

          //botão salvar
          MaterialButton(            
            //atualiza o endereço de entrega
            onPressed: () { 
              String newAddress = textController.text;
              context.read<Restaurante>().updateDeliveryAdress(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Salvar'),           
           )
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text("Entregue agora", style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //endereço
                Consumer<Restaurante>(
                  builder: (context, restaurante, child) => Text(
                  restaurante.deliveryAdress, 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
              ),
                  
                  
                //drop down menu
                const Icon(Icons.keyboard_arrow_down_outlined),
              ],
             ),
          ),
          ],
        ),
    );
  }
}
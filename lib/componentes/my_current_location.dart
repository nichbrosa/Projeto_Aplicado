import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Sua localização"),
        content: const TextField(decoration: InputDecoration(hintText: "Procure o endereço .."),
        ),
        actions: [
          //botão cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),           
          ),

          //botão salvar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Salvar'),           
          ),
          ]
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
                Text(
                  "Rua São Paulo, 1147 - Victor Konder", 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
                  
                  
                //drop down menu
                Icon(Icons.keyboard_arrow_down_outlined),
              ],
             ),
          ),
          ],
        ),
    );
  }
}
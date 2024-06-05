import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {

    //estilo do texto
    var MyPrimaryTextStyle = 
    TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var MySecundaryTextStyle = 
    TextStyle(color: Theme.of(context).colorScheme.primary);


    return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Theme.of(context).colorScheme.secondary),
      borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Taxa de entrega
          Column(
            children: [
              Text('R\$1,99', style: MyPrimaryTextStyle,),
              Text('Taxa de entrega', style: MySecundaryTextStyle,),
            ],
          ),

          //Tempo de entrega
          Column(
            children: [
              Text('10-15 minutos', style: MyPrimaryTextStyle,),
              Text('Tempo de entrega', style: MySecundaryTextStyle,),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_receipt.dart';

class ProgressoEntregaPagina extends StatelessWidget {
  const ProgressoEntregaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrega em progresso ..."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt()
        ],
      ),
    );
  }

  //Botao customizado - Mensagem / chamar o entregador
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          ),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            //foto do entregador
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape:  BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_outlined),
              ),
            ),

            const SizedBox(width: 10),

            //detalhes do entregador
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jorge Butcher",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              Text(
                "Entregador",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),

            const Spacer(),

            //botao mensagem
            Row(
              children: [
                Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape:  BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message_outlined),
                color:  Theme.of(context).colorScheme.primary,
              ),
            ),
              ],
            ),

            const SizedBox(width: 10),

            //botao ligar
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape:  BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call_outlined),
                color: Colors.green,
              ),
            ),
          ],
        ),
    );
  }
}
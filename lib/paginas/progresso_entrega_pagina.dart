import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_receipt.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:projeto_aplicado/servicos/database/firestore.dart';
import 'package:provider/provider.dart';

class ProgressoEntregaPagina extends StatefulWidget {
  const ProgressoEntregaPagina({super.key});

  @override
  State<ProgressoEntregaPagina> createState() => _ProgressoEntregaPaginaState();
}

class _ProgressoEntregaPaginaState extends State<ProgressoEntregaPagina> {
  //acesso ao banco
  FirestoreService banco = FirestoreService();

  @override
  void initState() {
    super.initState();

    //se chegarmos a essa pagina, enviamos o pedido ao banco de dados firestore
    String comida = context.read<Restaurante>().mostrarComidaCarrinho();
    String quantidade = context.read<Restaurante>().mostrarQuantidadeCarrinho();
    String entrega = context.read<Restaurante>().mostrarEntregaCarrinho();
    String taxa = context.read<Restaurante>().mostrarTaxaCarrinho();
    String total = context.read<Restaurante>().mostrarTotalCarrinho();
    banco.salvarPedidosNoBanco(comida, quantidade, entrega, taxa, total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [MyReceipt()],
        ),
      ),
    );
  }

  //Botao customizado - Mensagem / chamar o entregador
  Widget _buildBottomNavBar(BuildContext context) {
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
              shape: BoxShape.circle,
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
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message_outlined),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          const SizedBox(width: 10),

          //botao ligar
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
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

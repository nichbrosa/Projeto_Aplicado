import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:projeto_aplicado/componentes/my_button.dart';
import 'package:projeto_aplicado/paginas/progresso_entrega_pagina.dart';

class PagamentoPagina extends StatefulWidget {
  const PagamentoPagina({super.key});

  @override
  State<PagamentoPagina> createState() => _PagamentoPaginaState();
}

class _PagamentoPaginaState extends State<PagamentoPagina> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //usuario quer pagar
  void usuarioClicouPagar(){
    if(formKey.currentState!.validate()){
      //so mostrar o dialogo se o form for valido
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirmar pagamento'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Numero do cartão:  $cardNumber"),
                Text("Data de expiração:  $expiryDate"),
                Text("Dono do cartão:  $cardHolderName"),
                Text("CVV:  $cvvCode"),
              ],
            ),
          ),
          actions: [
            //botao cancelar
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),   
            ),
            
            //botao confirmar
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const ProgressoEntregaPagina(),
                  ),
                );
              },
              child: const Text("Sim"),
            ),
            
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pagar"),
      ),
      body: Column(
        children: [
          //cartao de credito
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            onCreditCardWidgetChange: (p0) {},
          ),

            //formulario cartao de credito
            CreditCardForm(
              cardNumber: cardNumber, 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName, 
              cvvCode: cvvCode, 
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;              
                });
              }, 
              formKey: formKey,
              ),

              const Spacer(),

              MyButton(
                text: "Pagar agora", 
                onTap: usuarioClicouPagar,
              ),

              const SizedBox(height: 25),
        ],
      ),
    );
  }
}
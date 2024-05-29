import 'package:flutter/material.dart';

import 'comida.dart';

class Restaurante extends ChangeNotifier{
  // lista de comidas no menu
  final List<Comida> _menu = [
    //hamburgueres
    Comida(
      nome: "Hamburguer simples", 
      descricao: 'Pão, queijo, chedar e carne bovina', 
      caminhoImagem: "lib/imagens/comidas/HAMBURGUE_SIMPLES.png", 
      preco: 20.00, 
      categoria: CategoriaComida.hamburguers, 
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
        ],
      ),
   
    //acompanhamentos
    Comida(
      nome: "Bolinho de carne", 
      descricao: 'Bolinho especial de carne recheado com queijo, 6 unidades', 
      caminhoImagem: "lib/imagens/comidas/BOLINHA2.png", 
      preco: 38.00, 
      categoria: CategoriaComida.acompanhamentos, 
      complementosDisponiveis: [
        Complemento(nome: "Maionese extra", preco: 0.99),
        Complemento(nome: "Ketchup extra", preco: 0.99),
        ],
      ),
    
    //sobremesa
    Comida(
      nome: "Bolo de chocolate sem gluten e leite", 
      descricao: 'Bolo com massa feita massa de pipoca e cacau em pó', 
      caminhoImagem: "lib/imagens/comidas/BOLO_DE_CHOCOLATE.png", 
      preco: 30.00, 
      categoria: CategoriaComida.sobremesas, 
      complementosDisponiveis: [
        Complemento(nome: "Pedaço extra", preco: 5.99),
        ],
      ),
    
    //bebida
    Comida(
      nome: "Coca-Cola", 
      descricao: 'Lata de coca-cola 350ML', 
      caminhoImagem: "lib/imagens/bebidas/COCA.png", 
      preco: 8.90, 
      categoria: CategoriaComida.bebidas, 
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
        ],
      ),
  ];

  /*

  GETTERS

  */

  List<Comida> get menu => _menu;

  /*

  OPERATIONS

  */

  // adicionar ao carrinho

  // remover do carrinho

  // preço total do carrinho


  // numero total de itens no carrinho

  // limpar carrinho
  /*

  HELPERS

  */

  // gerar recibo

  // formatar double valor em dinheiro

  // formatar lista de addons em uma string summary

}
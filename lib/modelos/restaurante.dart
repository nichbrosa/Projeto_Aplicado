import 'package:flutter/material.dart';

import 'comida.dart';

class Restaurante extends ChangeNotifier{
  // lista de comidas no menu
  final List<Comida> _menu = [
    //hamburgueres
    Comida(
      nome: "Hamburguer simples", 
      descricao: 'Pão, queijo chedar e carne bovina', 
      caminhoImagem: "lib/imagens/comidas/HAMBURGUE_SIMPLES2.png", 
      preco: 20.00, 
      categoria: CategoriaComida.hamburguers, 
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
        ],
      ),

    Comida(
      nome: "Duplo hamburguer", 
      descricao: '2 hamburgueres de pão, queijo chedar e carne bovina', 
      caminhoImagem: "lib/imagens/comidas/DOUBLE_BURGUER.jpg", 
      preco: 35.00, 
      categoria: CategoriaComida.hamburguers, 
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
        ],
      ),

          Comida(
      nome: "Hamburguer aberto", 
      descricao: 'Hamburguer aberto com champinon, salada, carne, pão e molho especial', 
      caminhoImagem: "lib/imagens/comidas/HAMBURGUER_ABERTO.jpeg", 
      preco: 30.00, 
      categoria: CategoriaComida.hamburguers, 
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
        ],
      ),

    Comida(
      nome: "Hamburguer com Ricota", 
      descricao: 'Pão, queijo de ricota e carne bovina', 
      caminhoImagem: "lib/imagens/comidas/HAMBURGUER_RICOTA.jpg", 
      preco: 26.00, 
      categoria: CategoriaComida.hamburguers, 
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
        ],
      ),

    Comida(
      nome: "Hamburguer Trufado", 
      descricao: 'Pão, queijo chedar, lascas de trufa e carne bovina', 
      caminhoImagem: "lib/imagens/comidas/HAMBURGUER_TRUFADO.jpg", 
      preco: 50.00, 
      categoria: CategoriaComida.hamburguers, 
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
        ],
      ),

    //salada


    //petiscos
    Comida(
      nome: "Bolinho de carne", 
      descricao: 'Bolinho especial de carne recheado com queijo, 6 unidades', 
      caminhoImagem: "lib/imagens/comidas/BOLINHA2.png", 
      preco: 38.00, 
      categoria: CategoriaComida.petiscos, 
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
      caminhoImagem: "lib/imagens/bebidas/COCA2.png", 
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
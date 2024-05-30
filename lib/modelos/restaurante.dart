import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/item_carrinho.dart';

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
  List<ItemCarrinho> get carrinho => _carrinho;

  /*

  OPERATIONS

  */

  //carrinho
  List<ItemCarrinho> _carrinho = [];

  // adicionar ao carrinho
  void adicionarAoCarrinho(Comida comida, List<Complemento> complementoSelecionado){
    //verificar se ja tem alguma comida no carrinho selecionado
    ItemCarrinho? itemCarrinho = _carrinho.firstWhereOrNull((item){
      //checar se os itens comidas são a mesma
      bool eComidaigual = item.comida == comida;

      //checar se a lista de complementos selecionados são os mesmos
      bool eComplementoigual =
          ListEquality().equals(item.complementoSelecionado, complementoSelecionado);

        return eComidaigual && eComplementoigual;
    });

    //se tiver, aumentar a quantidade
    if(itemCarrinho != null){
      itemCarrinho.quantidade++;
    }

    //senao, adicionar o item ao carrinho
    else{
      _carrinho.add(
        ItemCarrinho(
          comida: comida, 
          complementoSelecionado: complementoSelecionado,
          ),
      );
    }
    notifyListeners();
  }

  // remover do carrinho
  void removerDoCarrinho(ItemCarrinho itemCarrinho){
    int indexCarrinho = _carrinho.indexOf(itemCarrinho);

    if(indexCarrinho != -1){
      if(_carrinho[indexCarrinho].quantidade > 1){
        _carrinho[indexCarrinho].quantidade--;
      }else{
        _carrinho.removeAt(indexCarrinho);
      }
    }
    notifyListeners();
  }

  // preço total do carrinho
  double getPrecoTotal(){
    double total = 0.0;

    for(ItemCarrinho itemCarrinho in _carrinho){
      double itemTotal = itemCarrinho.comida.preco;

      for(Complemento complemento in itemCarrinho.complementoSelecionado){
        itemTotal += complemento.preco;
      }

      total += itemTotal * itemCarrinho.quantidade;
    }

    return total;
  }

  // numero total de itens no carrinho
  int getContagemItensTotal(){
    int contagemItensTotal = 0;

    for (ItemCarrinho itemCarrinho in _carrinho){
      contagemItensTotal += itemCarrinho.quantidade;
    }

    return contagemItensTotal;
  }

  // limpar carrinho
  void limparCarrinho(){
    _carrinho.clear();
    notifyListeners();
  }

  /*

  HELPERS

  */

  // gerar recibo

  // formatar double valor em dinheiro

  // formatar lista de addons em uma string summary

}
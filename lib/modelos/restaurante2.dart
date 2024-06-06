import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_aplicado/modelos/item_carrinho.dart';

import 'comida.dart';

class Restaurante2 extends ChangeNotifier{
  // lista de comidas no menu
  final List<Comida> _menu = [
    
    //bebida
    Comida(
      nome: "Coca-Cola", 
      descricao: 'Lata de coca-cola 350ML', 
      caminhoImagem: "lib/imagens/bebidas/COCA2.png", 
      preco: 8.90, 
      gluten: false,
      leite: false, 
      categoria2: CategoriaComida2.bebidas, 
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
        ],
      ),

      Comida(
      nome: "Macarrao", 
      descricao: 'Lata de coca-cola 350ML', 
      caminhoImagem: "lib/imagens/comidas/MACARRAO.png", 
      preco: 8.90, 
      gluten: false,
      leite: false, 
      categoria2: CategoriaComida2.spagheti, 
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
        ],
      ),
  ];

  //carrinho
  final List<ItemCarrinho> _carrinho = [];

  //endereço de entrega (alteravel pelo usuário)
  String _deliveryAdress = 'Rua São Paulo, 1147 - Victor Konder';

  

  /*

  GETTERS

  */

 bool _leiteIsVisible = true; // Variável para controlar a visibilidade dos itens com leite
 bool _glutenIsVisible = true; //  Variável para controlar a visibilidade dos itens com gluten

  List<Comida> get menu =>
      _menu.where((item) => (_leiteIsVisible || !item.leite) && (_glutenIsVisible || !item.gluten)).toList();

  

  List<ItemCarrinho> get carrinho => _carrinho;
  String get deliveryAdress => _deliveryAdress;
  bool get leiteIsVisible => _leiteIsVisible; // Getter público para _leiteIsVisible
  bool get glutenIsVisible => _glutenIsVisible; // Getter público para _glutenIsVisible


  void toggleLeiteVisibility() {
    _leiteIsVisible = !_leiteIsVisible;
    notifyListeners();
  }

    void toggleGlutenVisibility() {
    _glutenIsVisible = !_glutenIsVisible;
    notifyListeners();
  }


  /*

  OPERATIONS

  */



  // adicionar ao rcarrinho
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

      total += itemTotal * itemCarrinho.quantidade + 1.99;
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

  //atualizar o endereço de entrega
  void updateDeliveryAdress(String newAddress){
    _deliveryAdress = newAddress;
    notifyListeners();
  }

  /*

  HELPERS

  */

  // gerar recibo
  String mostrarReciboCarrinho(){
    final recibo = StringBuffer();
    recibo.writeln("Aqui está o seu recibo.");
    recibo.writeln();

    //formatar data para mostrar até segundos
    String formatarData = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    recibo.writeln(formatarData);
    recibo.writeln();
    recibo.writeln("------------");

    for(final itemCarrinho in _carrinho){
      recibo.writeln(
        "${itemCarrinho.quantidade} x ${itemCarrinho.comida.nome} - ${_formatarPreco(itemCarrinho.comida.preco)}");
      if(itemCarrinho.complementoSelecionado.isNotEmpty){
        recibo.writeln(
          " Complementos: ${_formatarComplemento(itemCarrinho.complementoSelecionado)}"
        );
      }
      recibo.writeln();
    }

    recibo.writeln("--------------");
    recibo.writeln();
    recibo.writeln("Total de itens: ${getContagemItensTotal()}");
    recibo.writeln("Total do preço: ${_formatarPreco(getPrecoTotal())}");
    recibo.writeln("Taxa de entrega: R\$1,99");
    recibo.writeln();
    recibo.writeln("Entregando para: $deliveryAdress");

    return recibo.toString();
  }
  
  // formatar double valor em dinheiro
  String _formatarPreco(double preco){
    return "R\$${preco.toStringAsFixed(2)}";
  }

  // formatar lista de addons em uma string summary
  String _formatarComplemento(List<Complemento> complemento){
    return complemento.map((complemento) => "${complemento.nome} (${_formatarPreco(complemento.preco)})")
    .join(", ");
  }
}
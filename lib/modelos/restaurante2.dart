import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_aplicado/modelos/item_carrinho.dart';

import 'comida.dart';

class Restaurante2 extends ChangeNotifier {
  // lista de comidas no menu
  final List<Comida> _menu = [
    //macarrao
    Comida(
      nome: "Macarrao",
      descricao: 'Macarrao com tomates frescos',
      caminhoImagem: "lib/imagens/comidas/MACARRAO.png",
      preco: 19.90,
      gluten: true,
      leite: false,
      categoria2: CategoriaComida2.spagheti,
      complementosDisponiveis: [
        Complemento(nome: "Queijo ralado", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Macarrao com camarão",
      descricao: 'Macarrao com camarões',
      caminhoImagem: "lib/imagens/comidas/MACARRAO_CAMARAO.png",
      preco: 20.90,
      gluten: true,
      leite: false,
      categoria2: CategoriaComida2.spagheti,
      complementosDisponiveis: [
        Complemento(nome: "Queijo ralado", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Macarrão Carbonara",
      descricao: 'O melhor macarrão',
      caminhoImagem: "lib/imagens/comidas/CARBONARA.png",
      preco: 22.90,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.spagheti,
      complementosDisponiveis: [
        Complemento(nome: "Queijo ralado", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Macarrão Bolonhesa",
      descricao: 'Macarrão a bolonhesa',
      caminhoImagem: "lib/imagens/comidas/BOLON.png",
      preco: 21.90,
      gluten: true,
      leite: false,
      categoria2: CategoriaComida2.spagheti,
      complementosDisponiveis: [
        Complemento(nome: "Queijo ralado", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Macarrão alho e óleo",
      descricao: 'Macarrão ao molho alho e óleo',
      caminhoImagem: "lib/imagens/comidas/ALHO.png",
      preco: 21.90,
      gluten: true,
      leite: false,
      categoria2: CategoriaComida2.spagheti,
      complementosDisponiveis: [
        Complemento(nome: "Queijo ralado", preco: 2.99),
      ],
    ),

    //pizzas
    Comida(
      nome: "Pizza de calabresa",
      descricao: 'Massa de soja e queijo de soja',
      caminhoImagem: "lib/imagens/comidas/CALABRESA.png",
      preco: 30.90,
      gluten: false,
      leite: false,
      categoria2: CategoriaComida2.pizza,
      complementosDisponiveis: [
        Complemento(nome: "Ketchup", preco: 0.99),
        Complemento(nome: "Maionese", preco: 0.99),
      ],
    ),

    Comida(
      nome: "Pizza de Frango",
      descricao: 'Pizza de frango',
      caminhoImagem: "lib/imagens/comidas/FRANGO.png",
      preco: 20.90,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.pizza,
      complementosDisponiveis: [
        Complemento(nome: "Catupiry", preco: 5.99),
        Complemento(nome: "Cheedar", preco: 5.99),
      ],
    ),

    Comida(
      nome: "Pizza Portuguesa",
      descricao: 'Pizza Sabor de ouro',
      caminhoImagem: "lib/imagens/comidas/PORTUGUESA.png",
      preco: 15.90,
      gluten: true,
      leite: false,
      categoria2: CategoriaComida2.pizza,
      complementosDisponiveis: [
        Complemento(nome: "Ketchup", preco: 0.99),
        Complemento(nome: "Maionese", preco: 0.99),
        Complemento(nome: "Queijo extra", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Pizza 4 queijos",
      descricao: 'Provolone, gorgonzola, muçarela e parmesão',
      caminhoImagem: "lib/imagens/comidas/QUEIJOS.png",
      preco: 10.90,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.pizza,
      complementosDisponiveis: [
        Complemento(nome: "Ketchup", preco: 0.99),
        Complemento(nome: "Maionese", preco: 0.99),
        Complemento(nome: "Queijo extra", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Pizza sem gluten e lactose",
      descricao: 'Pizza perfeita para intolerantes',
      caminhoImagem: "lib/imagens/comidas/PIZZA.png",
      preco: 12.90,
      gluten: false,
      leite: false,
      categoria2: CategoriaComida2.pizza,
      complementosDisponiveis: [
        Complemento(nome: "Ketchup", preco: 0.99),
        Complemento(nome: "Maionese", preco: 0.99),
      ],
    ),

    //lasanha
    Comida(
      nome: "Lasanha de bolonhesa",
      descricao: 'Lasanha com recheio delicioso',
      caminhoImagem: "lib/imagens/comidas/SANHA.png",
      preco: 16.90,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.lasanha,
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Lasanha de Frango",
      descricao: 'Lasanha com recheio de frango',
      caminhoImagem: "lib/imagens/comidas/FRAN.png",
      preco: 15.90,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.lasanha,
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 2.99),
      ],
    ),

    //sobremesa
    Comida(
      nome: "Bolo de chocolate sem gluten e leite",
      descricao: 'Bolo com massa feita massa de pipoca e cacau em pó',
      caminhoImagem: "lib/imagens/comidas/BOLO_DE_CHOCOLATE.png",
      preco: 15.00,
      gluten: false,
      leite: false,
      categoria2: CategoriaComida2.sobremesas,
      complementosDisponiveis: [
        Complemento(nome: "Pedaço extra", preco: 5.99),
      ],
    ),

    Comida(
      nome: "Torta alemã com sorvete de creme",
      descricao: 'Torta alemã recheada e uma bola de sorvete de creme',
      caminhoImagem: "lib/imagens/comidas/TORDA_SORVETE.png",
      preco: 16.00,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.sobremesas,
      complementosDisponiveis: [
        Complemento(nome: "Sorvete de chocolate em vez de creme", preco: 0.00),
      ],
    ),

    Comida(
      nome: "Torta de banana",
      descricao: 'Fatia Torta de banana com chantili',
      caminhoImagem: "lib/imagens/comidas/BANANA.png",
      preco: 8.00,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.sobremesas,
      complementosDisponiveis: [
        Complemento(nome: "Calda de chocolate", preco: 0.99),
        Complemento(nome: "Fatia extra", preco: 6.00),
      ],
    ),

    Comida(
      nome: "Torta de Limao",
      descricao: 'Fatia de Torta de Limao com chantili',
      caminhoImagem: "lib/imagens/comidas/LIMAO.png",
      preco: 8.00,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.sobremesas,
      complementosDisponiveis: [
        Complemento(nome: "Fatia extra", preco: 6.00),
      ],
    ),

    Comida(
      nome: "MilkShake",
      descricao: 'Milkshake, sabor no complemento',
      caminhoImagem: "lib/imagens/comidas/SHAKE.png",
      preco: 10.00,
      gluten: true,
      leite: true,
      categoria2: CategoriaComida2.sobremesas,
      complementosDisponiveis: [
        Complemento(nome: "Chocolate", preco: 0.00),
        Complemento(nome: "Creme", preco: 0.00),
        Complemento(nome: "Morango", preco: 0.00),
      ],
    ),

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

    //bebida
    Comida(
      nome: "Água",
      descricao: 'Garrafa de água 500ML',
      caminhoImagem: "lib/imagens/bebidas/AGUA.png",
      preco: 6.90,
      gluten: false,
      leite: false,
      categoria2: CategoriaComida2.bebidas,
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
        Complemento(nome: "Rodela de limão", preco: 1.99),
      ],
    ),

    //bebida
    Comida(
      nome: "Heineken Long-Neck",
      descricao: 'Heineken Long-Neck 330ML',
      caminhoImagem: "lib/imagens/bebidas/HEINEKEN.png",
      preco: 9.90,
      gluten: false,
      leite: false,
      categoria2: CategoriaComida2.bebidas,
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
      ],
    ),

    //bebida
    Comida(
      nome: "Spaten Long-Neck",
      descricao: 'Spaten Long-Neck 330ML',
      caminhoImagem: "lib/imagens/bebidas/SPATEN.png",
      preco: 9.90,
      gluten: false,
      leite: false,
      categoria2: CategoriaComida2.bebidas,
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Caipirinha",
      descricao: 'Caipirinha com rodelas de limão e gelo',
      caminhoImagem: "lib/imagens/bebidas/CAIPIRINHA.png",
      preco: 10.90,
      gluten: false,
      leite: false,
      categoria2: CategoriaComida2.bebidas,
      complementosDisponiveis: [
        Complemento(nome: "Caipirinha de vodka", preco: 0.00),
        Complemento(nome: "Caipirinha de cachaça", preco: 0.00),
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

  bool _leiteIsVisible =
      true; // Variável para controlar a visibilidade dos itens com leite
  bool _glutenIsVisible =
      true; //  Variável para controlar a visibilidade dos itens com gluten

  List<Comida> get menu => _menu
      .where((item) =>
          (_leiteIsVisible || !item.leite) &&
          (_glutenIsVisible || !item.gluten))
      .toList();

  List<ItemCarrinho> get carrinho => _carrinho;
  String get deliveryAdress => _deliveryAdress;
  bool get leiteIsVisible =>
      _leiteIsVisible; // Getter público para _leiteIsVisible
  bool get glutenIsVisible =>
      _glutenIsVisible; // Getter público para _glutenIsVisible

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
  void adicionarAoCarrinho(
      Comida comida, List<Complemento> complementoSelecionado) {
    //verificar se ja tem alguma comida no carrinho selecionado
    ItemCarrinho? itemCarrinho = _carrinho.firstWhereOrNull((item) {
      //checar se os itens comidas são a mesma
      bool eComidaigual = item.comida == comida;

      //checar se a lista de complementos selecionados são os mesmos
      bool eComplementoigual = const ListEquality()
          .equals(item.complementoSelecionado, complementoSelecionado);

      return eComidaigual && eComplementoigual;
    });

    //se tiver, aumentar a quantidade
    if (itemCarrinho != null) {
      itemCarrinho.quantidade++;
    }

    //senao, adicionar o item ao carrinho
    else {
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
  void removerDoCarrinho(ItemCarrinho itemCarrinho) {
    int indexCarrinho = _carrinho.indexOf(itemCarrinho);

    if (indexCarrinho != -1) {
      if (_carrinho[indexCarrinho].quantidade > 1) {
        _carrinho[indexCarrinho].quantidade--;
      } else {
        _carrinho.removeAt(indexCarrinho);
      }
    }
    notifyListeners();
  }

  // preço total do carrinho
  double getPrecoTotal() {
    double total = 0.0;

    for (ItemCarrinho itemCarrinho in _carrinho) {
      double itemTotal = itemCarrinho.comida.preco;

      for (Complemento complemento in itemCarrinho.complementoSelecionado) {
        itemTotal += complemento.preco;
      }

      total += itemTotal * itemCarrinho.quantidade + 1.99;
    }

    return total;
  }

  // numero total de itens no carrinho
  int getContagemItensTotal() {
    int contagemItensTotal = 0;

    for (ItemCarrinho itemCarrinho in _carrinho) {
      contagemItensTotal += itemCarrinho.quantidade;
    }

    return contagemItensTotal;
  }

  // limpar carrinho
  void limparCarrinho() {
    _carrinho.clear();
    notifyListeners();
  }

  //atualizar o endereço de entrega
  void updateDeliveryAdress(String newAddress) {
    _deliveryAdress = newAddress;
    notifyListeners();
  }

  /*

  HELPERS

  */

  // gerar recibo
  String mostrarReciboCarrinho() {
    final recibo = StringBuffer();
    recibo.writeln("Aqui está o seu recibo.");
    recibo.writeln();

    //formatar data para mostrar até segundos
    String formatarData =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    recibo.writeln(formatarData);
    recibo.writeln();
    recibo.writeln("------------\n");

    for (final itemCarrinho in _carrinho) {
      recibo.writeln(
          "${itemCarrinho.quantidade} x ${itemCarrinho.comida.nome} - ${_formatarPreco(itemCarrinho.comida.preco)}");
      if (itemCarrinho.complementoSelecionado.isNotEmpty) {
        recibo.writeln(
            " Complementos: ${_formatarComplemento(itemCarrinho.complementoSelecionado)}");
      }
      recibo.writeln();
    }

    recibo.writeln("--------------");
    recibo.writeln();
    recibo.writeln("Total de itens: ${getContagemItensTotal()}");
    recibo.writeln("Taxa de entrega: R\$1,99");
    recibo.writeln("Total do pedido: ${_formatarPreco(getPrecoTotal())}");
    recibo.writeln();
    recibo.writeln("Entregando para: $deliveryAdress");

    return recibo.toString();
  }

  // formatar double valor em dinheiro
  String _formatarPreco(double preco) {
    return "R\$${preco.toStringAsFixed(2)}";
  }

  // formatar lista de addons em uma string summary
  String _formatarComplemento(List<Complemento> complemento) {
    return complemento
        .map((complemento) =>
            "${complemento.nome} (${_formatarPreco(complemento.preco)})")
        .join(", ");
  }

  String mostrarComidaCarrinho() {
    final comida = StringBuffer();

    for (final itemCarrinho in _carrinho) {
      comida.writeln(
          "${itemCarrinho.quantidade} x ${itemCarrinho.comida.nome} - ${_formatarPreco(itemCarrinho.comida.preco)}");
      if (itemCarrinho.complementoSelecionado.isNotEmpty) {
        comida.writeln(
            "\n Complementos: ${_formatarComplemento(itemCarrinho.complementoSelecionado)}");
      }
    }

    return comida.toString();
  }

  String mostrarTotalCarrinho() {
    final total = StringBuffer();

    total.writeln("Total do pedido: ${_formatarPreco(getPrecoTotal())}");

    return total.toString();
  }

  String mostrarTaxaCarrinho() {
    final taxa = StringBuffer();

    taxa.writeln("Taxa de entrega: R\$1,99");

    return taxa.toString();
  }

  String mostrarQuantidadeCarrinho() {
    final quantidade = StringBuffer();

    quantidade.writeln("Total de itens: ${getContagemItensTotal()}");

    return quantidade.toString();
  }

  String mostrarEntregaCarrinho() {
    final entrega = StringBuffer();

    entrega.writeln("Entregando para: $deliveryAdress");

    return entrega.toString();
  }
}

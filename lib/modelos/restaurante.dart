import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_aplicado/modelos/item_carrinho.dart';

import 'comida.dart';

class Restaurante extends ChangeNotifier {
  // lista de comidas no menu
  final List<Comida> _menu = [
    //hamburgueres
    Comida(
      nome: "Hamburguer simples",
      descricao: 'Pão, queijo chedar e carne bovina',
      caminhoImagem: "lib/imagens/comidas/HAMBURGUE_SIMPLES2.png",
      preco: 20.00,
      categoria: CategoriaComida.hamburguers,
      gluten: true,
      leite: true,
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
      gluten: true,
      leite: true,
      categoria: CategoriaComida.hamburguers,
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Hamburguer aberto",
      descricao:
          'Hamburguer aberto com champinon, salada, carne, pão e molho especial',
      caminhoImagem: "lib/imagens/comidas/HAMBURGUER_ABERTO.jpeg",
      preco: 30.00,
      gluten: true,
      leite: true,
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
      gluten: true,
      leite: true,
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
      gluten: true,
      leite: true,
      categoria: CategoriaComida.hamburguers,
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
      ],
    ),

    //hot-dog
    Comida(
      nome: "Hot-Dog",
      descricao: 'Hot-Dog simples',
      caminhoImagem: "lib/imagens/comidas/HOTDOG.png",
      preco: 10.00,
      gluten: true,
      leite: false,
      categoria: CategoriaComida.hotdog,
      complementosDisponiveis: [
        Complemento(nome: "Salsicha extra", preco: 5.99),
        Complemento(nome: "Bacon", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Hot-Dog Americano",
      descricao: 'Hot-Dog Americano',
      caminhoImagem: "lib/imagens/comidas/AMERICANO.png",
      preco: 7.00,
      gluten: true,
      leite: false,
      categoria: CategoriaComida.hotdog,
      complementosDisponiveis: [
        Complemento(nome: "Salsicha extra", preco: 5.99),
      ],
    ),

    Comida(
      nome: "Hot-Dog Completo",
      descricao: 'Hot-Dog com tudo que tem direito',
      caminhoImagem: "lib/imagens/comidas/COMPLETO.png",
      preco: 15.00,
      gluten: true,
      leite: false,
      categoria: CategoriaComida.hotdog,
      complementosDisponiveis: [
        Complemento(nome: "Salsicha extra", preco: 5.99),
      ],
    ),

    Comida(
      nome: "Hot-Dog Duplo",
      descricao: 'Hot-Dog com duas salsichas',
      caminhoImagem: "lib/imagens/comidas/COMPLETO.png",
      preco: 16.00,
      gluten: true,
      leite: false,
      categoria: CategoriaComida.hotdog,
      complementosDisponiveis: [
        Complemento(nome: "Salsicha extra", preco: 5.99),
      ],
    ),

    Comida(
      nome: "Hot-Dog Prensado",
      descricao: 'Hot-Dog completo prensado',
      caminhoImagem: "lib/imagens/comidas/PRENSADO.png",
      preco: 20.00,
      gluten: true,
      leite: false,
      categoria: CategoriaComida.hotdog,
      complementosDisponiveis: [
        Complemento(nome: "Salsicha extra", preco: 5.99),
      ],
    ),

    //petiscos
    Comida(
      nome: "Bolinho de carne",
      descricao: 'Bolinho especial de carne recheado com queijo, 6 unidades',
      caminhoImagem: "lib/imagens/comidas/BOLINHA2.png",
      preco: 15.00,
      gluten: false,
      leite: true,
      categoria: CategoriaComida.petiscos,
      complementosDisponiveis: [
        Complemento(nome: "Maionese extra", preco: 0.99),
        Complemento(nome: "Ketchup extra", preco: 0.99),
      ],
    ),

    Comida(
      nome: "Batatas fritas",
      descricao: '300g de Batata frita',
      caminhoImagem: "lib/imagens/comidas/FRITAS.png",
      preco: 10.00,
      gluten: false,
      leite: true,
      categoria: CategoriaComida.petiscos,
      complementosDisponiveis: [
        Complemento(nome: "Bacon", preco: 2.99),
        Complemento(nome: "Cheedar", preco: 1.99),
      ],
    ),

    Comida(
      nome: "Tabua de frios",
      descricao: 'Tabua de frios com diversos tipos de iguarias',
      caminhoImagem: "lib/imagens/comidas/TABUA_FRIOS.png",
      preco: 20.00,
      gluten: false,
      leite: true,
      categoria: CategoriaComida.petiscos,
      complementosDisponiveis: [
        Complemento(nome: "Refill", preco: 5.00),
      ],
    ),

    Comida(
      nome: "Pão de alho",
      descricao: 'Pão de alho fresquinho',
      caminhoImagem: "lib/imagens/comidas/PAO.png",
      preco: 5.00,
      gluten: true,
      leite: false,
      categoria: CategoriaComida.petiscos,
      complementosDisponiveis: [
        Complemento(nome: "Refill", preco: 5.00),
      ],
    ),

    Comida(
      nome: "Cebola crisp",
      descricao: 'Cebola frita acompanha maionese',
      caminhoImagem: "lib/imagens/comidas/CEBOLA.png",
      preco: 7.00,
      gluten: false,
      leite: false,
      categoria: CategoriaComida.petiscos,
      complementosDisponiveis: [
        Complemento(nome: "Ketchup", preco: 0.99),
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
      categoria: CategoriaComida.sobremesas,
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
      categoria: CategoriaComida.sobremesas,
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
      categoria: CategoriaComida.sobremesas,
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
      categoria: CategoriaComida.sobremesas,
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
      categoria: CategoriaComida.sobremesas,
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
      categoria: CategoriaComida.bebidas,
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Água",
      descricao: 'Garrafa de água 500ML',
      caminhoImagem: "lib/imagens/bebidas/AGUA.png",
      preco: 6.90,
      gluten: false,
      leite: false,
      categoria: CategoriaComida.bebidas,
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
        Complemento(nome: "Rodela de limão", preco: 1.99),
      ],
    ),

    Comida(
      nome: "Heineken Long-Neck",
      descricao: 'Heineken Long-Neck 330ML',
      caminhoImagem: "lib/imagens/bebidas/HEINEKEN.png",
      preco: 9.90,
      gluten: false,
      leite: false,
      categoria: CategoriaComida.bebidas,
      complementosDisponiveis: [
        Complemento(nome: "Copo congelado", preco: 2.99),
      ],
    ),

    Comida(
      nome: "Spaten Long-Neck",
      descricao: 'Spaten Long-Neck 330ML',
      caminhoImagem: "lib/imagens/bebidas/SPATEN.png",
      preco: 9.90,
      gluten: false,
      leite: false,
      categoria: CategoriaComida.bebidas,
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
      categoria: CategoriaComida.bebidas,
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
      bool eComplementoigual = ListEquality()
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

      total += itemTotal * itemCarrinho.quantidade;
    }

    return total += 1.99;
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
    recibo.writeln("Total do preço: ${_formatarPreco(getPrecoTotal())}");
    recibo.writeln("Taxa de entrega: R\$1,99");
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
}

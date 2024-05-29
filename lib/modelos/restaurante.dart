import 'comida.dart';

class Restaurante {
  // lista de comidas no menu
  final List<Comida> _menu = [
    //hamburgueres
    Comida(
      nome: "Hamburguer simples", 
      descricao: 'Pão, queijo, chedar e carne bovina', 
      caminhoImagem: "lib/imagens/comidas/HAMBURGUE_SIMPLES", 
      preco: 20.00, 
      categoria: CategoriaComida.hamburguers, 
      complementosDisponiveis: [
        Complemento(nome: "Queijo extra", preco: 1.99),
        Complemento(nome: "Carne extra", preco: 4.99),
        Complemento(nome: "Bacon", preco: 2.99),
        ],
      ),
    //complemento

    //sobremesa

    //bebida
  ];
}
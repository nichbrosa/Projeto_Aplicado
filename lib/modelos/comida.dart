//Item comida
class Comida {
  final String nome; //x-salada
  final String descricao; //pão, salada, carne e queijo
  final String caminhoImagem; //lib/imagens/x-salada.png
  final double preco; //20,00
  final CategoriaComida? categoria;
  final CategoriaComida2? categoria2;
  bool gluten = true;
  bool leite = true; //hamburguer
  List<Complemento>
      complementosDisponiveis; //queijo extra, bacon, mais hamburguer]

  Comida({
    required this.nome,
    required this.descricao,
    required this.caminhoImagem,
    required this.preco,
    this.categoria,
    this.categoria2,
    required this.complementosDisponiveis,
    required this.gluten,
    required this.leite,
  });
}

//Categoria da comida Restaurante 1
enum CategoriaComida {
  hamburguers,
  saladas,
  petiscos,
  sobremesas,
  bebidas,
}

//Categoria da comida Restaurante 2
enum CategoriaComida2 {
  spagheti,
  saladas,
  petiscos,
  sobremesas,
  bebidas,
}

//Addons comida
class Complemento {
  String nome;
  double preco;

  Complemento({
    required this.nome,
    required this.preco,
  });
}

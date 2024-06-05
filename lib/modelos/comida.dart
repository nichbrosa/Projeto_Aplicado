//Item comida
class Comida {
  
    final String nome;                            //x-salada
    final String descricao;                       //pão, salada, carne e queijo
    final String caminhoImagem;                   //lib/imagens/x-salada.png
    final double preco;                           //20,00
    final CategoriaComida categoria; 
    bool gluten = true;
    bool leite = true;            //hamburguer
    List<Complemento> complementosDisponiveis;    //queijo extra, bacon, mais hamburguer]

    Comida({
      required this.nome,
      required this.descricao,
      required this.caminhoImagem,
      required this.preco,
      required this.categoria,
      required this.complementosDisponiveis,
      required this.gluten,
      required this.leite,
    });
}

    //Categoria da comida
    enum CategoriaComida{
      hamburguers,
      saladas,
      petiscos,
      sobremesas,
      bebidas,
      spagheti,
    }
    

    //Addons comida
    class Complemento{
      String nome;
      double preco;

      Complemento({
        required this.nome,
        required this.preco,
      });
    }


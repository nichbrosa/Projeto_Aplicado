import 'comida.dart';

class ItemCarrinho {
  Comida comida;
  List<Complemento> complementoSelecionado;
  int quantidade;

  ItemCarrinho({
    required this.comida,
    required this.complementoSelecionado,
    this.quantidade = 1,
  });

  double get totalPreco {
    double complementoPreco = 
      complementoSelecionado.fold(0, (sum,complemento) => sum + complemento.preco);
    return (comida.preco + complementoPreco) * quantidade; 
  }
}
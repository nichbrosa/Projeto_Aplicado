import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  //pegar a coleção dos pedidos
  final CollectionReference pedidos = 
    FirebaseFirestore.instance.collection('Pedidos');

  //salvar os pedidos no banco de dados
  Future<void> salvarPedidosNoBanco(String comida, String quantidade, String entrega, String taxa, String total) async {
    await pedidos.add({
      'data': DateTime.now(),
      'comida': comida,
      'quantidade': quantidade,
      'local de entrega': entrega,
      'taxa de entrega': taxa,
      'custo total': total
      //adicionar mais linhas se necessário
    });
  }
}
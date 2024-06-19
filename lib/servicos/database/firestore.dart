import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  //pegar a coleção dos pedidos
  final CollectionReference pedidos = 
    FirebaseFirestore.instance.collection('Pedidos');

  //salvar os pedidos no banco de dados
  Future<void> salvarPedidosNoBanco(String comida, String preco, String entrega) async {
    await pedidos.add({
      'data': DateTime.now(),
      'comida': comida,
      'preco': preco,
      'entrega': entrega
      //adicionar mais linhas se necessário
    });
  }
}
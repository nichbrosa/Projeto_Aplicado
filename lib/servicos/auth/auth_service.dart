import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // pegar as instancias da autenticacao do firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // pegar o usuario atual
  User? getUsuarioAtual() {
    return _firebaseAuth.currentUser;
  }

  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    //tentar sign in
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      getUsuarioAtual();
      return userCredential;
    }
    //pegar qualquer error
    on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw Exception('Por favor verificar informações');
      } else if (e.code == 'wrong-password') {
        throw Exception('Senha incorreta. Tente novamente');
      } else if (e.code == 'invalid-email') {
        throw Exception('E-mail inválido');
      } else {
        throw Exception('Erro de login');
      }
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    //tentar sign up
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      getUsuarioAtual();
      return userCredential;
    }
    //pegar qualquer error
    on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Este e-mail já está cadastrado');
      } else if (e.code == 'weak-password') {
        throw Exception('Senha é muito fraca');
      } else if (e.code == 'invalid-email') {
        throw Exception('E-mail inválido');
      } else {
        throw Exception('Erro ao cadastrar');
      }
    }
  }

  // sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

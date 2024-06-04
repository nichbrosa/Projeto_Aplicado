import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  // pegar as instancias da autenticacao do firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // pegar o usuario atual
  User? getUsuarioAtual(){
    return _firebaseAuth.currentUser;
  }

  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async{
    //tentar sign in
    try {
      UserCredential userCredential = 
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email, 
          password: password,
        );

      return userCredential;
    } 
    //pegar qualquer error
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async{
    //tentar sign up
    try {
      UserCredential userCredential = 
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, 
          password: password,
        );

      return userCredential;
    } 
    //pegar qualquer error
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }

}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signUp(
      String name, String email, String tel, String password) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore.collection('users').doc(user.user?.uid).set({
      'uid': user.user?.uid,
      'name': name,
      'email': email,
      'tel': tel,
    });
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

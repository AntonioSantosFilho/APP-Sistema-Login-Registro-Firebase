import 'package:firebase_auth/firebase_auth.dart';
import '../model/auth_model.dart';

class AuthController {
  final AuthModel _authModel = AuthModel();

  Future<UserCredential> handleSignIn(String email, String password) async {
    return await _authModel.signIn(email, password);
  }

  Future<UserCredential> handleSignUp(
      String name, String email, String tel, String password) async {
    return await _authModel.signUp(name, email, tel, password);
  }

  Future<void> handleSignOut() async {
    await _authModel.signOut();
  }
}

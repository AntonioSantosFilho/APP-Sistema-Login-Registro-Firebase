import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../view/home.dart';
import '../controller/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final AuthController _authController = AuthController();
  final TextEditingController _telController = TextEditingController();

  bool _isLogin = true;
  bool _passwordVisible = false;

  void _toggleFormType() {
    setState(() {
      _isLogin = !_isLogin;
      _formKey.currentState?.reset();
    });
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      try {
        UserCredential userCredential;
        if (_isLogin) {
          userCredential = await _authController.handleSignIn(
            _emailController.text,
            _passController.text,
          );
        } else {
          userCredential = await _authController.handleSignUp(
            _nameController.text,
            _emailController.text,
            _telController.text,
            _passController.text,
          );
        }
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(userCredential.user),
        ));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Erro: ${e.message}"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? "Login" : "Registro"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _isLogin
                    ? Image.network(
                        "https://placehold.it/200x200",
                      )
                    : Image.network(
                        "https://placehold.it/100x100",
                      ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20),
                if (!_isLogin)
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'BR',
                    onChanged: (phone) {
                      _telController.text = phone.completeNumber;
                    },
                  ),
                if (!_isLogin)
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Por favor, insira seu nome" : null,
                  ),
                if (!_isLogin) SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Por favor, insira seu email" : null,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, insira sua senha";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: _submit,
                  child: Text(_isLogin ? "Login" : "Registrar"),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: _toggleFormType,
                  child: Text(
                    _isLogin
                        ? "Não tem uma conta? Registre-se"
                        : "Já tem uma conta? Faça login",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

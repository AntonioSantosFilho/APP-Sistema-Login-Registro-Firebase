import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  final User? user;

  HomeScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo(a)"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "UID: ${user?.uid ?? 'Não disponível'}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Email: ${user?.email ?? 'Não disponível'}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              user == null
                  ? Text("Usuário não disponível")
                  : FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user?.uid)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData && snapshot.data!.exists) {
                            var userData =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nome: ${userData['name'] ?? 'Não disponível'}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Telefone: ${userData['tel'] ?? 'Não disponível'}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            );
                          } else {
                            return Text("Dados do usuário não encontrados.");
                          }
                        } else if (snapshot.hasError) {
                          return Text("Erro: ${snapshot.error}");
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => AuthScreen()),
                        );
                      },
                      child: Text("Sair")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firebase_service.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  final FirebaseService _firebaseService = FirebaseService();

  HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, ${user.displayName ?? 'Usuário'}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _firebaseService.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user.photoURL != null) Image.network(user.photoURL!),
            const SizedBox(height: 10),
            Text('Nome: ${user.displayName ?? 'Não disponível'}'),
            Text('Email: ${user.email ?? 'Não disponível'}'),
          ],
        ),
      ),
    );
  }
}

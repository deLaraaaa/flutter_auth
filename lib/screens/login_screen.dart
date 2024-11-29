import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../services/firebase_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/github_logo.png', width: 100),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  User? user = await _firebaseService.signInWithGitHub();
                  if (user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(user: user)),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro ao autenticar! $e')),
                  );
                }
              },
              child: Text('Login com GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}

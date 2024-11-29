import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGitHub() async {
    final redirectUri = dotenv.env['FIREBASE_API_KEY'];
    final clientId = dotenv.env['GITHUB_CLIENT_ID'];
    final clientSecret = dotenv.env['GITHUB_CLIENT_SECRET'];
    final url =
        'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUri&scope=read:user';

    // Redirecione para o GitHub (implemente usando o navegador)
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final code = response.body; // Obtenha o código retornado pelo GitHub.

      final tokenResponse = await http.post(
        Uri.parse('https://github.com/login/oauth/access_token'),
        headers: {'Accept': 'application/json'},
        body: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': code,
        },
      );

      final tokenData = jsonDecode(tokenResponse.body);
      if (tokenData['access_token'] != null) {
        final credential =
            GithubAuthProvider.credential(tokenData['access_token']);
        final userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
    }
    throw Exception('Erro ao autenticar com GitHub');
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

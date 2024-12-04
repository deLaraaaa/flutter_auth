# Flutter Auth App

Este é um aplicativo Flutter que utiliza autenticação com GitHub e Firebase.

## Requisitos

- Flutter SDK: ^3.5.4
- Dart SDK: ^3.5.4
- Android SDK: minSdk 23
- iOS SDK: minSdk 11.0

## Configuração do Projeto

1. **Clone o repositório:**

   ```sh
   git clone https://github.com/seu-usuario/flutter_auth.git
   cd flutter_auth

2. **Instale as dependências**

    ```sh
    flutter pub get

3. **Configuração do dotenv**

    ```sh
    FIREBASE_API_KEY=https://flutter-auth-9ea49.firebaseapp.com/__/auth/handler
    GITHUB_CLIENT_ID=Ov23liKa1vx2dWVxNmRA
    GITHUB_CLIENT_SECRET=9373e374745e8ce0d4833d1b27a944ff4d3003a1

4. **Executando o Projeto**

    ```sh
    flutter run

5. **Estrutura do Projeto**

    `lib/main.dart`: Ponto de entrada do aplicativo.

    `lib/screens/login_screen.dart`: Tela de login com autenticação GitHub.
    
    `lib/services/firebase_service.dart`: Serviço de autenticação com Firebase e GitHub.
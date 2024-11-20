import 'package:flutter/material.dart';

// Função principal para rodar o app
void main() {
  runApp(MyApp());
}

// Widget raiz do aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

// Tela de Login
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Função para validar email
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  // Função para mostrar diálogos
  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Lógica de Login com validações
  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showDialog('Erro', 'Por favor, preencha todos os campos.');
    } else if (!_isValidEmail(email)) {
      _showDialog('Erro', 'Por favor, insira um email válido.');
    } else if (password.length < 6) {
      _showDialog('Erro', 'A senha deve ter pelo menos 6 caracteres.');
    } else {
      _showDialog('Login Sucesso!', 'Bem-vindo, $email!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/fundo_login.jpg'), // Caminho da imagem
            fit: BoxFit.cover, // Ajusta a imagem ao fundo
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo de email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white
                      .withOpacity(0.8), // Fundo branco semi-transparente
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  labelStyle:
                      TextStyle(color: Color(0xFF6A1B9A)), // Cor roxa do texto
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF6A1B9A)), // Cor roxa da borda
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              // Campo de senha
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white
                      .withOpacity(0.8), // Fundo branco semi-transparente
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  labelStyle:
                      TextStyle(color: Color(0xFF6A1B9A)), // Cor roxa do texto
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF6A1B9A)), // Cor roxa da borda
                  ),
                ),
                obscureText: true, // Esconde a senha
              ),
              SizedBox(height: 16.0),
              // Botão de Login
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6A1B9A), // Cor roxa do botão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Імпортуємо екран профілю
import 'registration_screen.dart'; // Імпортуємо екран реєстрації

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(), // Початковий екран - логін
      routes: {
        '/profile': (context) => ProfileScreen(userData: {}), // Прокачайте цей маршрут, щоб передавати actual userData
        '/register': (context) => RegistrationScreen(), // Додаємо маршрут для реєстрації
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Логіка для логіну
  void _login() {
    // Тут повинна бути ваша логіка для перевірки логіну
    String email = _emailController.text;
    String password = _passwordController.text;

    // Просте перевірка на наявність даних для демонстрації
    if (email == 'user@example.com' && password == 'password123') {
      // Переходимо на профіль, передаючи дані користувача
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(userData: {'name': 'John Doe', 'email': email}),
        ),
      );
    } else {
      // Якщо дані введено неправильно
      _showErrorDialog();
    }
  }

  // Модальне вікно при невірних даних логіну
  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Error'),
          content: Text('Invalid email or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Перехід на екран реєстрації
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

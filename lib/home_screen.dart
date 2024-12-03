import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Переконайтесь, що цей файл правильно імпортується

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String>? userData; // Змінна для збереження даних користувача

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Завантажуємо дані користувача при ініціалізації
  }

  // Завантажуємо дані користувача з локального сховища
  void _loadUserData() async {
    Map<String, String>? data = await _getUserDataFromStorage();
    setState(() {
      userData = data; // Зберігаємо дані в стані
    });
  }

  // Функція для отримання даних користувача (імітована)
  Future<Map<String, String>?> _getUserDataFromStorage() async {
    // Імплементуйте тут логіку для отримання даних з локального сховища
    return {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
    }; // Наприклад, повертаємо деякі тестові дані
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (userData != null) {
              // Перевіряємо, чи дані користувача не null перед передачею
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(userData: userData!),
                ),
              );
            } else {
              // Якщо дані користувача null, показуємо повідомлення
              _showNoDataDialog();
            }
          },
          child: Text('Go to Profile'),
        ),
      ),
    );
  }

  // Модальне вікно для відсутності даних
  void _showNoDataDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No User Data'),
          content: Text('User data is not available. Please try again later.'),
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
}

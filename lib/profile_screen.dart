import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, String> userData; // Отримуємо дані користувача

  ProfileScreen({required this.userData}); // Приймаємо дані користувача через конструктор

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${userData['name'] ?? 'N/A'}'),
            Text('Email: ${userData['email'] ?? 'N/A'}'),
            // Виводимо інші дані профілю
          ],
        ),
      ),
    );
  }
}

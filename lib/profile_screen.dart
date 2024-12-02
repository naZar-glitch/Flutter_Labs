import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профіль користувача'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Аватарка користувача
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.png'), // Замість 'assets/avatar.png' додайте зображення у папку assets.
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            SizedBox(height: 16),

            // Ім'я користувача
            Center(
              child: Text(
                'Ім\'я Користувача',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),

            // Електронна пошта користувача
            Center(
              child: Text(
                'user@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            Divider(height: 32),

            // Інші деталі профілю
            Text(
              'Деталі профілю:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('Телефон'),
              subtitle: Text('+380 123 456 789'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text('Адреса'),
              subtitle: Text('вул. Лісова, 10, Київ, Україна'),
            ),
            ListTile(
              leading: Icon(Icons.cake, color: Colors.pink),
              title: Text('Дата народження'),
              subtitle: Text('1 січня 1990'),
            ),
            Spacer(),

            // Кнопка виходу
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Повертаємося на екран логіну
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text('Вийти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InteractiveCounter(),
    );
  }
}

class InteractiveCounter extends StatefulWidget {
  @override
  _InteractiveCounterState createState() => _InteractiveCounterState();
}

class _InteractiveCounterState extends State<InteractiveCounter> {
  int _counter = 0; // Змінна для збереження інкременту
  TextEditingController _textController = TextEditingController();

  void _handleInputChange(String input) {
    if (input == "Avada Kedavra") {
      setState(() {
        _counter = 0; // Скидаємо інкремент до 0
      });
    } else {
      int? number = int.tryParse(input);
      if (number != null) {
        setState(() {
          _counter += number; // Додаємо введене число до інкременту
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Інтерактивний лічильник'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Лічильник: $_counter',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Введіть текст або число',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                _handleInputChange(value);
                _textController.clear(); // Очищуємо текстове поле після вводу
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _handleInputChange(_textController.text);
                _textController.clear();
              },
              child: Text('Застосувати'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose(); // Звільняємо ресурси
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _catFacts = [];

  @override
  void initState() {
    super.initState();
    _fetchCatFacts();
  }

  Future<void> _fetchCatFacts() async {
    try {
      final response = await http.get(Uri.parse('https://cat-fact.herokuapp.com/facts'));
      if (response.statusCode == 200) {
        setState(() {
          _catFacts = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load cat facts');
      }
    } catch (e) {
      print('Error fetching cat facts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Facts'),
      ),
      body: _catFacts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _catFacts.length,
              itemBuilder: (context, index) {
                var fact = _catFacts[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(fact['text']),
                    subtitle: Text('Cat fact #${index + 1}'),
                  ),
                );
              },
            ),
    );
  }
}

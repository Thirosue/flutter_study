import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class Home extends StatelessWidget {
  static const String _title = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // disable back
        title: Text(_title),
        actions: <Widget>[
          Icon(Icons.add),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          },
          child: Text('Back to Login'),
        ),
      ),
    );
  }
}

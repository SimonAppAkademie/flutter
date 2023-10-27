import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinearGradient Beispiel'),
        backgroundColor: Colors.blue, // Hintergrundfarbe der AppBar
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green], // Farben im Verlauf
              begin: Alignment.topLeft, // Startpunkt des Verlaufs
              end: Alignment.bottomRight, // Endpunkt des Verlaufs
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.yellow], // Farben im Verlauf
              begin: Alignment.topCenter, // Startpunkt des Verlaufs
              end: Alignment.bottomCenter, // Endpunkt des Verlaufs
            ),
          ),
          child: Center(
            child: Text(
              'LinearGradient',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

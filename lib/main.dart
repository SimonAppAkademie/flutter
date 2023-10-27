import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Homescreen(),
        "/detailsScreen": (context) => const DetailsScreen(),
      },
    );
  }
}

class Homescreen extends StatelessWidget {
  final List<String> products = [
    "Produkt 1",
    "Produkt 2",
    "Produkt 3",
    "Produkt 4",
    "Produkt 5"
  ];
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Placeholder", style: TextStyle(color: Colors.black)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(131, 226, 255, 1),
              Color.fromRGBO(11, 198, 255, 1)
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          ),
        ),
      ),
      body: ListView(
        children: products.map((product) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.install_mobile),
              title: Text(product),
              onTap: () {
                Navigator.pushNamed(context, "/detailsScreen",
                    arguments: product);
              },
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: "Home 2",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.front_hand,
                color: Colors.brown,
              ),
              label: "Home 3"),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String productName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("DetailsScreen"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Produktname: $productName"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Zurück zum Homescreen"),
            ),
          ],
        ),
      ),
    );
  }
}

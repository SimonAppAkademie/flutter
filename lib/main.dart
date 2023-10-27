
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
        "/": (context) => const Homescreen(),
        "/detailsScreen": (context) => const DetailsScreen(),
        "/settings":(context) => const Settings(),
      },
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> products = [
    "Produkt 1",
    "Produkt 2",
    "Produkt 3",
    "Produkt 4",
    "Produkt 5"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Homescreen", style: TextStyle(color: Colors.black)),
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
      drawer: const MyDrawer(),
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
          child: Text(
            "DetailsScreen",
            style: TextStyle(color: Colors.black),
          ),
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

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Gerd Gierig",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              "gerdgierig@gmx.de",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(131, 226, 255, 1),
                Color.fromRGBO(11, 198, 255, 1)
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              "Homescreen",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              "Settings",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/settings");
            }
          ),
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Ape", style: TextStyle(color: Colors.black)),
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
      body: Center(
        child: Image.asset(
          "assets/images/ape.jpg"),
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
        Navigator.pushNamed(context, "/");
      } 
      ),
    );
  }
}

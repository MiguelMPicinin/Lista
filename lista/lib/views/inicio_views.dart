//classe do inicio

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class InicioViews extends StatefulWidget{ 
    @override
      _InicioState createState() => _InicioState();
}

class _InicioState extends State<InicioViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
      ),
      drawer: Drawer(child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Menu"),
          ),
          ListTile(
            title: Text("Tela Inicial"),
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
          ListTile(
            title: Text("Lista"),
            onTap: () {
              Navigator.pushNamed(context, "/lista");
            },
          ),
          ListTile(
            title: Text("Infográfico"),
            onTap: () {
              Navigator.pushNamed(context, "/infografico");
            },
          ),
        ],
      ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem-vindo à Tela Inicial!"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/lista");
              },
              child: Text("Ir para Lista"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/infografico");
              },
              child: Text("Ir para o infográfico"),
            ),
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Lista',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'Info',
              ),
            ]),
          ],  
        ),
      ), 
    );
  }
}
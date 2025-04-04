//classe do inicio

import 'package:flutter/material.dart';
// Para a navegação para a tela de Lista

// ignore: use_key_in_widget_constructors
class InicioViews extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<InicioViews> {
  int _selectedIndex = 0; // Controle do índice da barra de navegação

  // Função para mudar a tela dependendo do item selecionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegar para a página correspondente ao item selecionado
    if (index == 0) {
      Navigator.pushNamed(context, '/'); // Página inicial
    } else if (index == 1) {
      Navigator.pushNamed(context, '/lista'); // Tela da lista
    }
    // Você pode adicionar mais condições para outras telas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
      ),
      drawer: Drawer(
        child: ListView(
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
        ),
      ),
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
          ],
        ),
      ),
      // BottomNavigationBar no Scaffold para ficar fixada na parte inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
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
        ],
        onTap: _onItemTapped, // Chamando a função de navegação
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
    } else if (index == 2) {
      Navigator.pushNamed(context, '/Info'); // Navegar para Info
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
        backgroundColor: Colors.blue, // Cor da AppBar
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue), // Cor do DrawerHeader
              child: Text("Menu", style: TextStyle(color: Colors.white)), // Texto do DrawerHeader em branco
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
              title: Text("Tarefa Info"),
              onTap: () {
                Navigator.pushNamed(context, "/Info"); // Alterado para Info
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
                Navigator.pushNamed(context, "/Info"); // Alterado para Info
              },
              child: Text("Ir para Tarefa Info"),
            ),
          ],
        ),
      ),
      // BottomNavigationBar no Scaffold para ficar fixada na parte inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blue, // Cor da BottomNavigationBar
        selectedItemColor: Colors.white, // Cor do item selecionado na BottomNavigationBar
        unselectedItemColor: Colors.white70, // Cor dos itens não selecionados
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

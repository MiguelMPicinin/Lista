//classe da lista

import 'package:flutter/material.dart';

// Ignore a anotação, pois você irá alterar o nome da classe de TarefaScreen para TarefaView
class TarefaView extends StatefulWidget {
  const TarefaView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TarefaViewState createState() => _TarefaViewState();
}

class _TarefaViewState extends State<TarefaView> {
  // Listas de tarefas
  List<String> pendentes = [];
  List<String> concluidas = [];

  // Controlador de texto
  final TextEditingController _controller = TextEditingController();

  // Função para adicionar tarefa
  void adicionarTarefa() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        pendentes.add(_controller.text);
      });
      _controller.clear(); // Limpa o campo de texto
    }
  }

  // Função para mover tarefa para concluídas
  void concluirTarefa(int index) {
    setState(() {
      concluidas.add(pendentes[index]);
      pendentes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
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
      body: Column(
        children: [
          // Campo para adicionar tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Nova tarefa'),
            ),
          ),
          ElevatedButton(
            onPressed: adicionarTarefa,
            child: Text('Adicionar Tarefa'),
          ),
          
          // Lista de tarefas pendentes
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Tarefas Pendentes:', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pendentes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pendentes[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () => concluirTarefa(index),
                  ),
                );
              },
            ),
          ),

          // Lista de tarefas concluídas
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Tarefas Concluídas:', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 200,  // Ajuste conforme necessário
            child: ListView.builder(
              itemCount: concluidas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(concluidas[index]),
                );
              },
            ),
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
      
    );
  }
}
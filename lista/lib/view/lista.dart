import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TarefaScreen(),
    );
  }
}

class TarefaScreen extends StatefulWidget {
  @override
  _TarefaScreenState createState() => _TarefaScreenState();
}

class _TarefaScreenState extends State<TarefaScreen> {
  // Listas de tarefas
  List<String> pendentes = [];
  List<String> concluidas = [];

  // Controlador de texto
  TextEditingController _controller = TextEditingController();

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
      body: Column(
        children: [
          // Campo para adicionar tarefa
          TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Nova tarefa'),
          ),
          ElevatedButton(
            onPressed: adicionarTarefa,
            child: Text('Adicionar Tarefa'),
          ),
          
          // Lista de tarefas pendentes
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
          Text('Tarefas Concluídas:'),
          Expanded(
            child: ListView.builder(
              itemCount: concluidas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(concluidas[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

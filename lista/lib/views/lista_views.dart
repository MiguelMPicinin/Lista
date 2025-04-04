import 'package:flutter/material.dart';

// Ignore a anotação, pois você irá alterar o nome da classe de TarefaScreen para TarefaView
class TarefaView extends StatefulWidget {
  const TarefaView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TarefaViewState createState() => _TarefaViewState();
}

class _TarefaViewState extends State<TarefaView> with SingleTickerProviderStateMixin {
  // Listas de tarefas
  List<String> pendentes = [];
  List<String> concluidas = [];

  // Controlador de texto
  final TextEditingController _controller = TextEditingController();

  // Controlador do TabBar
  late TabController _tabController;

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

  // Controla a navegação da BottomNavigationBar
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegar para as telas correspondentes
    if (index == 0) {
      Navigator.pushNamed(context, '/'); // Navegar para a tela inicial
    } else if (index == 1) {
      // Já estamos na tela de lista
    } else if (index == 2) {
      Navigator.pushNamed(context, '/Info'); // Navegar para o infográfico
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Inicializa o TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Descartando o TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        backgroundColor: Colors.blue, // Cor da AppBar
        bottom: TabBar(
          controller: _tabController, // Controla o TabBar
          tabs: [
            Tab(text: 'Pendentes'), // Aba de pendentes
            Tab(text: 'Concluídas'), // Aba de concluídas
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue), // Cor do DrawerHeader
              child: Text("Menu", style: TextStyle(color: Colors.white)), // Texto do DrawerHeader em branco
            ),
            // Ícones no Drawer com 1/4 da largura do Drawer
            SizedBox(
              width: MediaQuery.of(context).size.width / 4, // 1/4 da largura da tela
              child: IconButton(
                icon: Icon(Icons.home, size: 40, color: Colors.blue),
                onPressed: () {
                  Navigator.pushNamed(context, '/'); // Navegar para a tela inicial
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4, // 1/4 da largura da tela
              child: IconButton(
                icon: Icon(Icons.list, size: 40, color: Colors.blue),
                onPressed: () {
                  Navigator.pushNamed(context, '/lista'); // Navegar para a tela da lista
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4, // 1/4 da largura da tela
              child: IconButton(
                icon: Icon(Icons.info, size: 40, color: Colors.blue),
                onPressed: () {
                  Navigator.pushNamed(context, '/Info'); // Navegar para o infográfico
                },
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Controla o TabBarView
        children: [
          // Aba de tarefas pendentes
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller, // Controlador de texto para a nova tarefa.
                  decoration: InputDecoration(hintText: 'Nova tarefa'),
                ),
              ),
              ElevatedButton(
                onPressed: adicionarTarefa, // Chama a função para adicionar tarefa.
                child: Text('Adicionar Tarefa'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Tarefas Pendentes:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: pendentes.length, // Contagem das tarefas pendentes.
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(pendentes[index]), // Exibe a tarefa pendente.
                      trailing: IconButton(
                        icon: Icon(Icons.check), // Ícone de check para marcar como concluída.
                        onPressed: () => concluirTarefa(index), // Chama a função para concluir tarefa.
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Aba de tarefas concluídas
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Tarefas Concluídas:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: concluidas.length, // Contagem das tarefas concluídas.
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(concluidas[index]), // Exibe a tarefa concluída.
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      // Colocando a BottomNavigationBar no final da tela
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
        onTap: _onItemTapped, // Função para navegar
      ),
    );
  }
}

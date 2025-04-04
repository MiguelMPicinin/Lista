import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';  // Pacote para gráficos

class GraficoView extends StatefulWidget {
  @override
  _GraficoViewState createState() => _GraficoViewState();
}

class _GraficoViewState extends State<GraficoView> {
  int _selectedIndex = 0;

  // Função para mudar a tela dependendo do item selecionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegação entre telas
    if (index == 0) {
      Navigator.pushNamed(context, '/'); // Página inicial
    } else if (index == 1) {
      Navigator.pushNamed(context, '/lista'); // Tela de lista
    } else if (index == 2) {
      // Já estamos na tela GraficoView, então não há navegação
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações de Tarefas"),
        backgroundColor: Colors.blue, // Cor da AppBar
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu", style: TextStyle(color: Colors.white)),
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
                Navigator.pushNamed(context, "/Info");
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Card 1 - 45% Feitas
                  Expanded(
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('45% Feitas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            CircularProgressIndicator(
                              value: 0.45,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Card 2 - 55% Não Feitas
                  Expanded(
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('55% Não Feitas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            CircularProgressIndicator(
                              value: 0.55,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Gráfico de Barras
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Progresso das Tarefas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 250, // Altura definida para o gráfico
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(toY: 45, color: Colors.blue, width: 20)
                        ],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(toY: 55, color: Colors.red, width: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // BottomNavigationBar no Scaffold
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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
        onTap: _onItemTapped,
      ),
    );
  }
}

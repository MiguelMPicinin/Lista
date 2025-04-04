
import 'package:flutter/material.dart';
import 'package:lista/views/Info.dart';
import 'package:lista/views/inicio_views.dart';
import 'package:lista/views/lista_views.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: { //3 telas de navegação do App
      "/": (context) => InicioViews(),
      "/lista":(context) => TarefaView(),
      "/Info":(context) => GraficoView(),
    },
  ));
}
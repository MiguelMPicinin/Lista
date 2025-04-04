
import 'package:flutter/material.dart';
import 'package:lista/views/inicio_views.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: { //3 telas de navegação do App
      "/": (context) => InicioViews(),
      "/lista":(context) => ,
      "/infografico":(context) => ,
    },
  ));
}
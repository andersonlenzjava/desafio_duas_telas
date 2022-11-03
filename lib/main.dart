import 'package:flutter/material.dart' show BuildContext, Colors, Key, MaterialApp,  StatelessWidget, ThemeData, Widget, runApp;
import 'package:nosso_primeiro_projeto/data/person_inherited.dart';

import 'screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), // iherited é o widget principal ao qual todos se conectam pelo context
      home: PersonInherited(child: const InitialScreen()), // ponto que coloca o widget que vem de fora
    );
  }
}











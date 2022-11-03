import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, Container, EdgeInsets, FloatingActionButton, Icon, Icons, Key, ListView, MaterialPageRoute, Navigator, Scaffold, State, StatefulWidget, Text, Widget;
import 'package:nosso_primeiro_projeto/data/person_inherited.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {

  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // constrói automaticamente o botão de voltar
        leading: Container(),
        title: const Text('Pessoas Cadastradas'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: PersonInherited.of(context).personList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push( // empilha
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(personContext: context,), // passa a variavel context
            ),//faz a navegação para a formScreen, montada em cima da atual
          );
        },
        child: const Icon(Icons.add, color: Colors.yellowAccent,),
      ),
    );
  }
}
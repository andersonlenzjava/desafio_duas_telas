import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/person.dart';

// objeto que vai armazenar os objetos das classes criadas
class PersonInherited extends InheritedWidget {
  PersonInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  // lista que pode ser acessado por todos pelo context
  final List<Person> personList = [];

  // manipulação da lista que é acessada e exibida na tela, cria o objeto person, coloca os atributos, e adiciona ele na lista
  void newPerson(String name, int idade, int telefone){
    personList.add(Person(name, idade, telefone));
  }

  static PersonInherited of(BuildContext context) {
    final PersonInherited? result = context.dependOnInheritedWidgetOfExactType<PersonInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  // ele acompanha o estado widget e o atualiza se ele é alterado
  @override
  bool updateShouldNotify(PersonInherited oldWidget) {
    return oldWidget.personList.length != personList.length;
  }
}

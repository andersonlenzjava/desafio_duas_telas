import 'package:flutter/material.dart';
import 'package:number_to_words/number_to_words.dart';

// um tipo de classe que pode ser repetida e tem métodos que são modulares
// statefull permite que se altere seus valores
class Person extends StatefulWidget {
  final String nome;
  final int idade;
  final int telefone;
  const Person(this.nome, this.idade, this.telefone,{Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}
class _PersonState extends State<Person> {


  @override
  Widget build(BuildContext context) { // cada evento do botão ocorre o reinicio do build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.lightBlue.shade100,// com o boxDeco ele não pode ter no container cor
            ),
            height: 140,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.nome,
                  style: const TextStyle(
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis, // limita o tamanho do text
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Idade : ',
                      style: TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(widget.idade.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(NumberToWord().convert('en-in',widget.idade),
                      style: const TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text(' years',
                      style: TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Telefone: ',
                      style: TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(widget.telefone.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
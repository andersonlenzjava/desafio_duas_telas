import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/person_inherited.dart';

// uma classe que chama outra classe
class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.personContext}) : super(key: key);

  // atribuição deste parametro para poder inserir contexto dentro do form_screen
  // pegar o contexto que é atualizado
  final BuildContext personContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  //váriavel que recebe o texto
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // variavel global que monitora os fields
  final _formKey = GlobalKey<FormState>();

  // método que verifica se o campo é null
  bool valueValidator(String? value) {
    if(value != null && value.isEmpty){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form( // formulario que permite fazer a autenticação dos textField
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar pessoa'),
        ),
        body: Center( // widget que encapsula o seu interno
          child: SingleChildScrollView(// permite todo o conjunto ser scrollavel
            child: Container(
                height: 650,
                width: 375,
                decoration: BoxDecoration( // Com o boxDecoration necessita colocar cor dentro dele
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3),

                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value){ // validação do campo
                        if(valueValidator(value)){
                          return 'Escreva o seu nome';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome Completo',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value){
                        if(valueValidator(value)){
                          return 'Informe sua idade';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number, // habilita teclado numerico
                      controller: ageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Idade : Anos',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value){
                        if(valueValidator(value)){
                          return 'Informe o seu telefone';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Telefone ex: (11)9123456789',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()) { // se presionado valida o estado
                      // aqui carrega o contexto que veio da outra pagina
                      PersonInherited.of(widget.personContext).newPerson(
                          nameController.text,
                          int.parse(ageController.text),
                          int.parse(phoneController.text));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Adicionando uma pessoa'), // envia uma mensagem na tela
                         ),
                      );
                      Navigator.pop(context); // tira a pagina da pilha e faz mais algumas funções programadas
                    }
                  }, child: const Text('Adicionar!', style: TextStyle(fontSize: 24),),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



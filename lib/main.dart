import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

main() => runApp(PerguntasApp());

class _PerguntasAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'texto': 'Qual seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
      },
      {
        'texto': 'Qual seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Leo', 'Dogla']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto']),
            Resposta("Resposta 1", _responder),
            Resposta("Resposta 2", _responder),
            Resposta("Resposta 3", _responder),
            Resposta("Resposta 3", _responder),
          ],
        ),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}

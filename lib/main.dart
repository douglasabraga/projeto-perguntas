import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntasApp());

class _PerguntasAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 2},
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 4},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu corte de cabelo favorito?',
      'respostas': [
        {'texto': 'Tijelinha', 'pontuacao': 1},
        {'texto': 'Piqui Blainder', 'pontuacao': 7},
        {'texto': 'Moicano', 'pontuacao': 3},
        {'texto': 'Disfarçado', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual seu barbeiro favorito favorito?',
      'respostas': [
        {'texto': 'Deivão', 'pontuacao': 8},
        {'texto': 'Tarik', 'pontuacao': 7},
        {'texto': 'Netto', 'pontuacao': 10},
        {'texto': 'Gelso Motta', 'pontuacao': 5},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Perguntas do Doglão!"),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntaSelecionada: _perguntaSelecionada,
                  perguntas: _perguntas,
                  responder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}

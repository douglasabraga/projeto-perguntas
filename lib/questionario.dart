import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  Questionario(
      {@required this.perguntaSelecionada,
      @required this.perguntas,
      @required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(children: [
      Questao(perguntas[perguntaSelecionada]['texto']),
      ...respostas.map((resp) {
        return Resposta(
          texto: resp['texto'],
          quandoSelecionado: () => responder(resp['pontuacao']),
        );
      }).toList(),
    ]);
  }
}

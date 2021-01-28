import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 10) {
      return 'Você é bom';
    } else if (pontuacao < 12) {
      return 'Você é bom D+';
    } else if (pontuacao < 15) {
      return 'Você é muito bom';
    } else if (pontuacao < 21) {
      return 'TO sem palavras...';
    } else {
      return 'Tu é brabissimo!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: reiniciarQuestionario,
        )
      ],
    );
  }
}

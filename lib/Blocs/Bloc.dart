import 'package:flutter/material.dart';

class _blocButtonBack{

  Future<bool> _botaoVoltar(){
    return showDialog(
      builder: (context) => AlertDialog(
        title: Text ('Você tem certeza?'),
        content: Text('Você voltará a tela anterior'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Não'),
          ),
          FlatButton(
            onPressed: (){},
            child: Text('Sim'),
          )
        ],
      ),
    );
  }
}
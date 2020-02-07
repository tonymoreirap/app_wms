import 'package:app_wms/Pages/Conf_Abastecimento.dart';
import 'package:flutter/material.dart';

import 'Menu.dart';

class Devolucao extends StatefulWidget {



  @override
  _DevolucaoState createState() => _DevolucaoState();
}

class _DevolucaoState extends State<Devolucao> {


  List devolucoes = [
    'Devolução 001',
    'Devolução 002',
    'Devolução 003',
    'Devolução 004',
    'Devolução 005',
    'Devolução 006',
    'Devolução 007',
    'Devolução 008',
    'Devolução 009'
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _botaoVoltar,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Devolução"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: _botaoVoltar,
          ),
        ),
        body: _body(),
      ),
    );
  }

  _body(){
    return Container(
      color: Colors.lightBlue,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: devolucoes.length,
          itemBuilder: (contex, index){

            final item = devolucoes[index];

            return Dismissible(
              key: Key(item),
              onDismissed: (direction){
                setState(() {
                  devolucoes.removeAt(index);
                });
                Scaffold
                    .of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                        "$item Removido"
                    ),
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment(-0.9, 0),
                  child: Icon(Icons.delete_forever, color: Colors.white,),
                ),
              ),
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (contex) => Conf_Abastecimento()));
                    });
                  },
                  child: Container(
                    height: 70,
                    child: ListTile(
                      subtitle: Text('Status: Pendente || Data: 28/01/2020',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),),
                      title: Text(devolucoes[index],
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<bool> _botaoVoltar(){
    return showDialog(
      context: context,
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

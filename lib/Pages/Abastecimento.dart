import 'package:app_wms/pages/Conf_Abastecimento.dart';
import 'package:flutter/material.dart';
import 'Menu.dart';

class Abastecimento extends StatefulWidget {

  @override
  _AbastecimentoState createState() => _AbastecimentoState();
}

class _AbastecimentoState extends State<Abastecimento> {


  List abastecimentos = ['Abastecimento 1','Abastecimento 2','Abastecimento 3',
    'Abastecimento 4','Abastecimento 5','Abastecimento 6',
    'Abastecimento 7','Abastecimento 8','Abastecimento 9','Abastecimento 10',
    'Abastecimento 11','Abastecimento 12','Abastecimento 13','Abastecimento 14'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abastecimento"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: _body(),
    );
  }
  _body(){
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: abastecimentos.length,
          itemBuilder: (contex, index){

            final item = abastecimentos[index];

            return Dismissible(
              key: Key(item),
              onDismissed: (direction){
                setState(() {
                  abastecimentos.removeAt(index);
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
                      subtitle: Text('Status: Pendente || Data: 27/01/20207',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),),
                      title: Text(abastecimentos[index],
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
}

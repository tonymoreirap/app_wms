import 'package:flutter/material.dart';

class Lista_Abastecimento extends StatefulWidget {
  @override
  _Lista_AbastecimentoState createState() => _Lista_AbastecimentoState();
}

class _Lista_AbastecimentoState extends State<Lista_Abastecimento> {

  List abastecimentos = ['Roteador wireless 4 portas 450mbps TL-WR940N Tp Link CX'
    'Cabo de rede RJ45 5m azul 0100700002K Force-line BT'
    'Filtro de linha 5 tomadas 10A bivolt preto slim Force-line BT',
    'Organizador p/cabos e fios 19,1mmx2m branco Hellermanntyton PT',
    'Roteador wireless 4 portas Dual Band AC1350 C60 Tp Link CX',
    'Roteador wireless 4 port.Dual Band AC1200 Archer C6 Tp Link CX',
    'Alicate de crimpagem RJ45 / RJ11 / RJ22 5303 Force-line BT',
    'Conector adaptador T RJ45 c/ 3 conexões 270393 Multi PT',
    'Conector macho RJ45 212843 Multi PT',
    'Cabo de rede UTP CAT 5E 305mt azul 3295 Force-line CX',
    'Cabo de rede UTP CAT 5E 305mt azul claro APC PT',
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _botaoVoltar,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Abastecimento'),
          centerTitle: true,
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
                  onTap: (){},
                  child: Container(
                    height: 110,
                    child: ListTile(
                      subtitle: Text('Qtd: 10 || Data: 28/01/2020',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),),
                      title: Text(abastecimentos[index],
                        style: TextStyle(
                            fontSize: 15,
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

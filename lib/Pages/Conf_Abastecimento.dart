import 'package:app_wms/Blocs/Conf_Abastecimento_Bloc.dart';
import 'package:app_wms/Widgets/app_text.dart';
import 'package:app_wms/pages/Abastecimento.dart';
import 'package:app_wms/pages/Lista_Abastecimento.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Conf_Abastecimento extends StatefulWidget {

  @override
  _Conf_AbastecimentoState createState() => _Conf_AbastecimentoState();
}

class _Conf_AbastecimentoState extends State<Conf_Abastecimento> {



/*  int _counter = 0;
  int _decrementa = 0;

  void _incrementCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = (preferences.getInt('counter') ?? 0) + 1;
    await preferences.setInt('counter', _counter);
  }

  void _decrementaCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _decrementa = (preferences.getInt('decrementa') ?? 0) - 1;
    await preferences.setInt('decrementa', _decrementa);
  }*/


/*  @override
  void initState() {
    _leContador();
    _leDecremento();
    super.initState();
  }

  _leContador()async{
    SharedPreferences preferences = SharedPreferences.getInstance() as SharedPreferences;
    setState(() {
      _counter = (preferences.getInt('counter')?? 0);
    });
  }

  _leDecremento()async{
    SharedPreferences preferences = SharedPreferences.getInstance() as SharedPreferences;
    setState(() {
      _decrementa = (preferences.getInt('decrementa')?? 0);
    });
  }*/

  //Conf_Abastecimento_Bloc bloc = Conf_Abastecimento_Bloc();

/*  void _incrementaCounter(){
    bloc.add(Conf_Abs_Event.incrementa);
  }

  void _decrementaCounter(){
    bloc.add(Conf_Abs_Event.decrementa);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }*/

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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: AppText('Produto', hintText: 'Teste',),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Scan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),
                    ),
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("QR Code",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    ),
                    onPressed: (){},
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Descrição",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                    height: 110,
                    width: 340,
                    child: Text("Roteador Wireless Tp-link TL-WR940N 450mbps - 3 Antenas 5 Portas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Qtd Abast.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove_circle, size: 35,),
                  color: Colors.red,
                  onPressed: (){
                    //_decrementaCounter();
                  },
                ),
/*                BlocBuilder<Conf_Abastecimento_Bloc, int>(
                  //stream: bloc,
                  //condition: (previous, state) => state >= 0,
                  bloc: bloc,
                  builder: (context, state) {
                    return Text("${state}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),);
                  }
                ),*/
                IconButton(
                  icon: Icon(Icons.add_box, size: 35,),
                  color: Colors.red,
                  onPressed: (){
                    //_incrementaCounter();
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Lista',
                      style: TextStyle(
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Lista_Abastecimento()));
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Limpar',
                      style: TextStyle(
                      ),
                    ),
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text('Confirmar',
                      style: TextStyle(
                      ),
                    ),
                    onPressed: (){},
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Abastecimento()));
            },
            child: Text('Sim'),
          )
        ],
      ),
    );
  }

  void campoTextFormField(){

  }
}


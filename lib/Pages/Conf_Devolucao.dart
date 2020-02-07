import 'package:app_wms/Pages/Abastecimento.dart';
import 'package:app_wms/Pages/Devolu%C3%A7%C3%A3o.dart';
import 'package:app_wms/Pages/Lista_Abastecimento.dart';
import 'package:app_wms/Widgets/app_raise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_wms/util/nave.dart';

class Conf_Devolucao extends StatefulWidget {
  @override
  _Conf_DevolucaoState createState() => _Conf_DevolucaoState();
}

class _Conf_DevolucaoState extends State<Conf_Devolucao> {
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
  }


  @override
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _botaoVoltar,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Devolução'),
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

  _body() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextFormField(
                autofocus: true,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  labelText: "Produto",
                  hintStyle: TextStyle(
                      color: Colors.orange, fontStyle: FontStyle.italic),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Bipar ou digitar o produto",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AppRaiseButtom('Scan'),
                  AppRaiseButtom('QR Code')
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    child: Text(
                      "Roteador Wireless Tp-link TL-WR940N 450mbps - 3 Antenas 5 Portas",
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
                  Text(
                    "Qtd Devol.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    size: 35,
                  ),
                  color: Colors.red,
                  onPressed: () {},
                ),
                Text(
                  "0",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_box,
                    size: 35,
                  ),
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppRaiseButtom('Lista', onPressed: () => push(context, Lista_Abastecimento())),
                  AppRaiseButtom('Limpar', onPressed:() => push(context, Lista_Abastecimento())),
                  AppRaiseButtom('Confirmar', onPressed:() => push(context, Lista_Abastecimento())),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _botaoVoltar() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Você tem certeza?'),
        content: Text('Você voltará a tela anterior'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Não'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Abastecimento()));
            },
            child: Text('Sim'),
          )
        ],
      ),
    );
  }
}

import 'package:app_wms/Pages/Abastecimento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home2.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("imagens/tecnologia.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("imagens/WMS_Expert.png",
                  width: 200,
                  height: 150,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.white,
                  Colors.white,
                ])
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset("imagens/Logtech4.png", width: 270, height: 110, ),
                    )
                  ],
                ),
              )
            ),

              ListTile(
                leading: Icon(Icons.pie_chart, color: Colors.green),
                title: Text('Recebimento'),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Abastecimento()));
                },
              ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Abastecimento'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(context, MaterialPageRoute());
              },
            ),
            ListTile(
              leading: Icon(Icons.data_usage),
              title: Text('Devolução'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(context, MaterialPageRoute());
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Inventário'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(context, MaterialPageRoute());
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart),
              title: Text('Ordem de Serviço'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(context, MaterialPageRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}

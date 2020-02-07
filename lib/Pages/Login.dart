import 'package:app_wms/Pages/Menu.dart';
import 'package:app_wms/Validator/Login_Api.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
/*  TextEditingController _controllerEmail  = TextEditingController();
  TextEditingController _controllerSenha  = TextEditingController();*/

  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("imagens/WMS_Fundo.jpg"), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "imagens/WMS_Expert.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                TextFormField(
                  controller: _ctrlLogin,
                  validator: _validaLogin,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Login",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22)),
                    //errorText: snapshot.hasError ? snapshot.error : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextFormField(
                  controller: _ctrlSenha,
                  validator: _validaSenha,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "Acessar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Color(0xff1ebbd8),
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      onPressed: () {
                        _clickButton(context);
                      }),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta? Cadastre-se",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  String _validaLogin(String texto) {
    if (texto.isEmpty) {
      return 'Digite Login';
    }
    return null;
  }

  String _validaSenha(String texto) {
    if (texto.isEmpty) {
      return 'Digite a Senha';
    }
    return null;
  }

  void _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    String login = _ctrlLogin.text;
    String senha = _ctrlSenha.text;

    print('login:  $login senha: $senha');

    var response = await loginAPI(login.trim(), senha.trim());

    if (response == response){
      _menu(context);

    }

  }

  _menu(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
  }
}

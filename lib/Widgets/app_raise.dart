import 'package:flutter/material.dart';

class AppRaiseButtom extends StatelessWidget {

  String text;
  Function onPressed;

  AppRaiseButtom(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
      onPressed: onPressed,
    );
  }
}

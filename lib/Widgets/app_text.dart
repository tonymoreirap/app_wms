

import 'package:flutter/material.dart';


class AppText extends StatelessWidget {

  String labelText;
  String hintText;


  AppText(this.labelText, {this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      maxLines: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        labelText: labelText,
        hintStyle:TextStyle(
            color: Colors.orange,
            fontStyle:FontStyle.italic
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(32)
        ),
      ),
    );
  }
}

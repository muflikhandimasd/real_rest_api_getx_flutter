// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CheetahButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const CheetahButton({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      padding: const EdgeInsets.all(8),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 18)),
      color: Colors.black,
      textColor: Colors.white,
      splashColor: Colors.orange,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white70,
    );
  }
}

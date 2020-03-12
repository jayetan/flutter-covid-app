import 'package:flutter/material.dart';

class LabelTextWidget extends StatelessWidget {
  final String label;
  final String text;

  LabelTextWidget({@required this.label, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$text',
        ),
      ],
    );
  }
}
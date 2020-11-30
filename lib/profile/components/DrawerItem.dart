import 'package:flutter/material.dart';
import 'package:thebase_app/types/typedefs.dart';

class DrawerItem extends StatelessWidget {

  final String text;
  final VoidFunction onPressed;

  const DrawerItem({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
      ),
      onPressed: onPressed,
    );
  }
}


class DrawerSubItem extends StatelessWidget {

  final String text;
  final VoidFunction onPressed;

  const DrawerSubItem({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 18.0,
        ),
      ),
      onPressed: onPressed,
    );
  }
}

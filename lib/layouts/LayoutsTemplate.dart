import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;

  LayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
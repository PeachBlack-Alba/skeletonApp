import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thebase_app/localizations/localizations.dart';
import 'package:thebase_app/managers/blocs/AuthBloc.dart';
import 'package:thebase_app/managers/blocs/AuthState.dart';
import 'package:thebase_app/services/provide.dart';
import 'package:thebase_app/ui/routing/routes.dart';

import 'DrawerWidget.dart';

class DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Drawer(
          child: SafeArea(
              child: ListView(children: <Widget>[
                ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text(AppLocalizations.of(context).logout()),
                    onTap: () {
                      context.blocs.auth.logout(context);
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Routes.welcome);
                    }),
              ])));
    });
  }
}

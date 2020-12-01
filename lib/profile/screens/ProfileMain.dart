import 'package:flutter/material.dart';
import 'package:skeleton_app/appBar/AppBarCurved.dart';
import 'package:skeleton_app/components/drawer/DrawerCurved.dart';
import 'BodyProfile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCurved('Hello this is your profile page'),
      endDrawer: DrawerCurved(),
      body: BodyProfile(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:thebase_app/ui/components/appBarComponent/AppBarCurved.dart';
import 'package:thebase_app/ui/components/drawer/DrawerCurved.dart';
import 'package:thebase_app/ui/screens/profile/screens/BodyProfile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCurved('Hello Profile'),
      endDrawer: DrawerCurved(),
      body: BodyProfile(),
    );
  }
}

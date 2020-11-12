import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_app/utils/ScreenUtil.dart';
import 'package:thebase_app/ui/screens/profile/components/AppBarProfile.dart';

class AppBarCurved extends StatelessWidget implements PreferredSize {

  final String title;

  AppBarCurved(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBarProfile(
        preferredSize: Size(ScreenUtil.screenWidth(context), 200),
        firstIcon: IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Container(
            child: Icon(Icons.menu, color: Colors.black),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black, width: 3),
            ),
          ),
        ),
        title: title
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(200);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
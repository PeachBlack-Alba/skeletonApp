import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:skeleton_app/profile/components/DrawerItem.dart';
import 'package:thebase_app/ui/routing/routes.dart';
import 'package:thebase_app/ui/screens/profile/components/BottomSheetShape.dart';
import 'package:thebase_app/ui/screens/profile/components/DrawerItem.dart';
import 'package:thebase_app/ui/styles/Colors.dart';

import '../BottomSheetShape.dart';

class DrawerCurved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: _DrawerClipper(),
        child: Drawer(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 48, bottom: 32),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      margin: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: TheBaseColors.lightGreen,
                      ),
                      child:  Container(
                        child: Icon(Icons.close, color: Colors.black),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                  DrawerItem(
                    text: 'Connect to instagram',
                    onPressed: () {
                      Navigator.pop(context);
                      pushNewScreen(
                        context,
                        screen: Routes.getWidgetForRoute(Routes.instagram, context),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  DrawerItem(
                    text: 'Payment Details',
                    onPressed: () {
                      Navigator.pop(context);
                      pushNewScreen(
                        context,
                        screen: Routes.getWidgetForRoute(Routes.payment, context),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  DrawerSubItem(
                    text: 'Add/Modify',
                    onPressed: () {},
                  ),
                  DrawerSubItem(
                    text: 'Report a Problem',
                    onPressed: () {},
                  ),
                  DrawerItem(
                    text: 'Sollar',
                    onPressed: () {},
                  ),
                  DrawerItem(
                    text: 'My Contracts',
                    onPressed: () {
                      Navigator.pop(context);
                      pushNewScreen(
                        context,
                        screen: Routes.getWidgetForRoute(Routes.bodyContracts, context),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);

                      _OpenSignOutDrawer(context);
                    },
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Not your account? ',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Out',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _OpenSignOutDrawer(BuildContext context) {
    showModalBottomSheet(
        shape: BottomSheetShape(),
        backgroundColor: TheBaseColors.lightGreen,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(top: 24.0, bottom: 16.0, left: 48.0, right: 48.0),
            height: 180.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Name, do you really want to sign out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.black,
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {},
                        borderSide: BorderSide(color: Colors.black),
                        color: TheBaseColors.lightGreen,
                        child: Text(
                          'Keep Logged in',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class _DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // LINES TO THE DRAWER
    path.moveTo(50, 0);
    // x1-y1 starter point / x2-y2 finish point
    path.quadraticBezierTo(0, size.height / 2, 50, size.height);
    // size.height/2 => middle of the altura
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

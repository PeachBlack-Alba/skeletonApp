import 'package:flutter/material.dart';
import 'package:thebase_app/ui/components/appBarComponent/AppBarCurved.dart';
import 'package:thebase_app/ui/components/drawer/DrawerCurved.dart';
import 'package:thebase_app/ui/screens/profile/components/AppBarProfile.dart';
import 'package:thebase_app/ui/screens/profile/components/CustomSwitch.dart';
import 'package:thebase_app/ui/styles/Colors.dart';

class InstagramScreen extends StatefulWidget {
  @override
  _InstagramScreenState createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCurved('Connect to Instagram'),
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Show my Instagram',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomSwitch(
                        isOn: false,
                        activeBorderColor: Colors.black,
                        inactiveBorderColor: Colors.black,
                        borderWidth: 1,
                        padding: 8,
                        activeColor: TheBaseColors.lightGreen,
                        inactiveColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        activeText: "ON",
                        inactiveText: "OFF",
                        activeTextStyle: TextStyle(
                          color: Colors.black,
                        ),
                        inactiveTextStyle: TextStyle(
                          color: Colors.black,
                        ),
                        activeThumbColor:
                        Colors.white,
                        inactiveThumbColor:
                        TheBaseColors.lightGreen,
                        thumbHeight: 20,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 64,
                  thickness: 3,
                  color: TheBaseColors.lightGreen,
                  indent: 32,
                  endIndent: 32,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: Container(
                        height: 40.0,
                        width: 150.0,
                        margin: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text('Main Screen',
                              style: Theme.of(context).textTheme.headline6),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      endDrawer: DrawerCurved(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:skeleton_app/components/drawer/DrawerCurved.dart';
import 'package:thebase_app/ui/components/appBarComponent/AppBarCurved.dart';
import 'package:thebase_app/ui/components/drawer/DrawerCurved.dart';
import 'package:thebase_app/ui/screens/profile/components/AppBarProfile.dart';
import 'package:thebase_app/ui/screens/profile/components/CustomSwitch.dart';
import 'package:thebase_app/ui/styles/Colors.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCurved('My Payment Methods'),
      key: _scaffoldKey,
      //empty Appbar will detect that there is a endDrawer, so will add by default a menu icon
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
                        'We need to decide',
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
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:thebase_app/ui/components/textFieldContainer/InputField.dart';
import 'package:thebase_app/ui/screens/profile/components/TextFormProfile.dart';
import 'package:thebase_app/ui/styles/Colors.dart';

class AddInformation extends StatefulWidget {
  @override
  _AddInformationState createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: AddInformationClipper(),
            child: Container(
              decoration: BoxDecoration(color: TheBaseColors.lightGreen),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                      child: Text('This is',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(60.0, 80.0, 0.0, 0.0),
                      child: Text('Your information',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300.0, 35.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: TheBaseColors.lightRed)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(child: TextFormProfile())
            ],
          ),
        ],
      ),
    );
  }
}

class AddInformationClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height / 4);
    path.lineTo(size.width - 40, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
/*

class AddInformationBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);



    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
*/

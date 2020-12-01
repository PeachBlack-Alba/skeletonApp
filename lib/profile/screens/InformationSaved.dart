import 'package:flutter/material.dart';
import 'package:thebase_app/ui/styles/Colors.dart';

class InformationSaved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheBaseColors.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                  child: Text('Your information',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(60.0, 80.0, 0.0, 0.0),
                  child: Text('has been saved',
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
    );
  }
}

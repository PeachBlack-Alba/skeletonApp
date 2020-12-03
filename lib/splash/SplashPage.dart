import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thebase_app/ui/animations/FadeIn.dart';
import 'package:thebase_app/ui/styles/Colors.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fadeInCounter = 0;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: TheBaseColors.darkGreen),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FadeIn(
                        delaySecs: 0.5 * fadeInCounter++,
                        child: Image(
                          image: AssetImage('assets/img/logored.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      FadeIn(
                        delaySecs: 0.5 * fadeInCounter++,
                        translateX: 0,
                        child: Text(
                          'Welcome to your new home',
                          style: TextStyle(color: TheBaseColors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FadeIn(
                      delaySecs: 0.5 * fadeInCounter++,
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(TheBaseColors.lightBlue)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    FadeIn(
                      delaySecs: fadeInCounter++,
                      child: Text(
                        'Loading',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

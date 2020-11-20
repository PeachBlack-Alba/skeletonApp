import 'package:flutter/material.dart';
import 'package:thebase_app/types/typedefs.dart';
import 'package:thebase_app/ui/screens/events/EventDetailsPage.dart';
import 'package:thebase_app/ui/screens/contracts/BodyContracts.dart';
import 'package:thebase_app/ui/screens/home/HomePage.dart';
import 'package:thebase_app/ui/screens/login/LoginPage.dart';
import 'package:thebase_app/ui/screens/profile/ProfileMain.dart';
import 'package:thebase_app/ui/screens/profile/screens/AddInformation.dart';
import 'package:thebase_app/ui/screens/profile/screens/InformationSaved.dart';
import 'package:thebase_app/ui/screens/profile/screens/InstagramScreen.dart';
import 'package:thebase_app/ui/screens/profile/screens/PaymentScreen.dart';
import 'package:thebase_app/ui/screens/splash/SplashPage.dart';
import 'package:thebase_app/ui/screens/welcome/WelcomePage.dart';

class Routes {
  static String home = '/home';
  static String loginPage = '/login';
  static String splash = '/splash';
  static String welcome = '/welcome';
  static String profile = '/profile';
  static String payment = '/payment';
  static String instagram = '/instagram';
  static String addInformation = '/addInformation';
  static String informationSaved = '/informationSaved';
  static String bodyContracts = '/bodyContracts';


  static String eventDetails = '/event';

  static Widget getWidgetForRoute(String route, BuildContext context) {
    if (getRoutes()[route] != null) {
      return getRoutes()[route](context);
    }

    return getRoutes()[welcome](context);
  }

  static Map<String, WidgetFromContextFunction> getRoutes() {
    return {
      home: (BuildContext context) => HomePage(),
      loginPage: (BuildContext context) => LoginPage(),
      splash: (BuildContext context) => SplashPage(),
      welcome: (BuildContext context) => WelcomePage(),
      profile: (BuildContext context) => Profile(),
      payment: (BuildContext context) => PaymentScreen(),
      instagram: (BuildContext context) => InstagramScreen(),
      addInformation: (BuildContext context) => AddInformation(),
      informationSaved: (BuildContext context) => InformationSaved(),
      bodyContracts: (BuildContext context) => BodyContracts(),

      eventDetails: (BuildContext context) => EventDetailsPage(),
    };
  }
}

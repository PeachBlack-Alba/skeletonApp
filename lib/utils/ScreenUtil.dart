import 'package:flutter/cupertino.dart';

class ScreenUtil {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenSafeAreaHorizontal(BuildContext context) {
    return screenWidth(context) -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
  }

  static double screenSafeAreaVertical(BuildContext context) {
    return screenHeight(context) -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }

  static double screenSafeAreaTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double horizontalSize(BuildContext context, double size) {
    return screenWidth(context) * size / 100;
  }

  static double verticalSize(BuildContext context, double size) {
    return screenHeight(context) * size / 100;
  }

  static double getAppBarPreferredHeight(BuildContext context) {
    return screenSafeAreaTop(context) + 50;
  }
}

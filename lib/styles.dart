import 'package:flutter/material.dart';

abstract class AppStyles {
  TextStyle getTitleStyle();
}

class DefaultStyles implements AppStyles {

  @override
  TextStyle getTitleStyle() {
    return TextStyle(
      color: Colors.red,
      fontSize: 14
    );
  }

}

class SpecialStyles implements AppStyles {

  @override
  TextStyle getTitleStyle() {
    return TextStyle(
      color: Colors.blue,
      fontSize: 17
    );
  }

}

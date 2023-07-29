import 'package:flutter/material.dart';

extension ExtendedNavigator on BuildContext {
  Future<dynamic> push(Widget page) async {
    return Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  Future<dynamic> pushReplacement(Widget page) async {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pop([result]) {
    return Navigator.of(this).pop(result);
  }
}


// onPressed: () {
//                context.push(MyPage());
//                     },
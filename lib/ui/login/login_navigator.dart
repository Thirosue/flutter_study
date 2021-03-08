import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../helpers/route_navigator.dart';

class LoginNavigator implements RouteNavigator {
  void next(BuildContext context, String message) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    Navigator.pushNamed(context, Constants.index);
  }
}

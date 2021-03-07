import 'package:flutter/material.dart';

import '../../helpers/route_navigator.dart';
import '../index/index.dart';

class LoginNavigator implements RouteNavigator {
  void next(BuildContext context, String message) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Index(),
      ),
    );
  }
}

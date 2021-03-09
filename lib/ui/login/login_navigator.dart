import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../route_navigator.dart';

class LoginNavigator implements RouteNavigator {
  void next(BuildContext context, String message) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    Get.toNamed(Constants.index);
  }
}

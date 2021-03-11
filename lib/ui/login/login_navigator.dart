import 'package:get/get.dart';

import '../../constants.dart';
import '../../helpers/message_utils.dart';
import '../../route_navigator.dart';

class LoginNavigator implements RouteNavigator {
  void next(String message) {
    Get.toNamed(Constants.index);

    MessageUtils.showSnackBar('ログイン', message);
  }
}

import 'package:get/get.dart';

import '../../constants.dart';
import '../../helpers/message_utils.dart';

class LoginNavigator {
  void next(String message) {
    Get.toNamed(Constants.index);

    MessageUtils.showSnackBar('ログイン', message);
  }
}

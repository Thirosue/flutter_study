import 'package:get/get.dart';

class MessageUtils {
  static void showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

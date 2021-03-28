import 'package:get/get.dart';

class MessageUtils {
  static void showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static String paddingZeroByte(int target, int width) =>
      target.toString().padLeft(width, "0");

  static String paddingTimeOfDay(int target) => paddingZeroByte(target, 2);
}

import 'dart:math';
import 'package:uuid/uuid.dart';

class Utils {
  static Object emptyUuid = "00000000-0000-0000-0000-000000000000";

  static bool isNullOrEmpty(String? value) {
    return value == null || value == "";
  }

  static String getErrorMessage(e) {
    if (e.runtimeType == String) {
      return e as String;
    }

    var message = "";
    try {
      if (e.response != null) {
        if (e.response.runtimeType == String) {
          message = e.response as String;
        } else if (e.response?.data?.runtimeType == String) {
          message = e.response.data as String;
        } else if (e.response?.data != null && e.response?.data["errors"] != null) {
          message = e.response.data["errors"].join("\n");
        } else if (e.response?.path != null) {
          if (e.response.path.runtimeType == String) {
            message = e.response.path as String;
          } else if (e.response.path["errors"] != null) {
            message = e.response.path["errors"].join("\n");
          }
        }
      }

      if (message != "") return message;
    } catch (e) {
      message = "";
    }

    message = e?.message;
    if (!Utils.isNullOrEmpty(message)) return message;

    return "Unknown error";
  }

  static double toDouble(String value) {
    value = value.replaceAll(",", ".");

    return double.parse(value);
  }

  static String generateGuid() {
    return const Uuid().v4();
  }

  static String generateRandomString(int length) {
    final random = Random();
    const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    final randomString = List.generate(length, (index) => availableChars[random.nextInt(availableChars.length)]).join();

    return randomString;
  }
}

import 'package:intl/intl.dart';

class Util {
  static String appId ="5be94197ef1104526d20f0412401e04e";

  static String getFormatedDate(DateTime date) {
    return new DateFormat("EEEE, MMM d, y").format(date);
  }
}
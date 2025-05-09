import 'package:fluttertoast/fluttertoast.dart';
import 'package:what_chat/app/theme/theme.dart';


void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: tabColor ,
      textColor: whiteColor,
      fontSize: 16.0);
}
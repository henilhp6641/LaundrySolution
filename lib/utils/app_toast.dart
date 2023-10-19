
import 'package:fluttertoast/fluttertoast.dart';

import '../res/color_schema.dart';

void showAppToast(String? msg) {
  if (msg == null || msg.isEmpty) {
    return;
  }
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    //backgroundColor: themeData(AppColor.yellowColor, AppColor.purple300),
    textColor: AppColor.white,
    fontSize: 14,
    gravity: ToastGravity.BOTTOM,
  );
}

void showErrorToast(String? msg) {
  if (msg == null || msg.isEmpty) {
    return;
  }
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: AppColor.errorColor,
    textColor: AppColor.white,
    fontSize: 14,
    gravity: ToastGravity.BOTTOM,
  );
}

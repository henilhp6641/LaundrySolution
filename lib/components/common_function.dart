import 'package:flutter/material.dart';

import '../package/config_packages.dart';
import '../res/color_schema.dart';

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

showCustomSnackBar(
    {String title = '', Color? textColor, Color? backgroundColor}) {
  Get.showSnackbar(
    GetSnackBar(
      borderRadius: 6,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      messageText: const SizedBox(),
      maxWidth: MediaQuery.of(Get.context!).size.width,
      titleText: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 26, right: 26, top: 11, bottom: 8),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
      backgroundColor: backgroundColor ?? Colors.black.withOpacity(0.9),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 3000),
    ),
  );
}

CachedNetworkImage getImageView(
    {required String finalUrl,
    double height = 40,
    double width = 40,
    fit = BoxFit.none,
    Decoration? shape,
    Color? color}) {
  return CachedNetworkImage(
    imageUrl: finalUrl,
    fit: fit,
    height: height,
    width: width,
    placeholder: (context, url) => Container(
      margin: const EdgeInsets.all(10),
      height: height,
      width: width,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColor.purpleGradient1,
        ),
      ),
    ),
    errorWidget: (context, url, error) => SizedBox(
      height: height,
      width: width,
      child: const Icon(Icons.error),
    ),
  );
}

class Throttler {
  Throttler({required this.throttleGapInMillis});

  final int throttleGapInMillis;
  int? lastActionTime;

  void run(VoidCallback action) {
    if (lastActionTime == null) {
      action();
      lastActionTime = DateTime.now().millisecondsSinceEpoch;
    } else {
      if (DateTime.now().millisecondsSinceEpoch - lastActionTime! >
          (throttleGapInMillis)) {
        action();
        lastActionTime = DateTime.now().millisecondsSinceEpoch;
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ft_washing_app/res/text_style.dart';
import 'package:ft_washing_app/utils/enum.dart';

import '../components/buttons.dart';

class ErrorSheet{
  static void showErrorSheet(String errorText, {Function()? onTap}) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsetsDirectional.only(
            start: 24, end: 24, top: 18, bottom: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Note:",
              style: TextStyle(
                color: context.textTheme.titleLarge?.color,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            for (var data in errorText.split(',')) ...{
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 4),
                      child: CircleAvatar(
                          backgroundColor: context.textTheme.titleLarge?.color,
                          radius: 5),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        data.trim().capitalizeFirst ?? "",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: context.textTheme.titleLarge?.color,
                          fontSize: 16,
                        ).normal16w600,
                      ),
                    ),
                  ],
                ),
              ),
            },
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: CommonAppButton(
                buttonType: ButtonType.enable,
                text: "Okay",
                onTap: onTap ?? () => Get.back(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
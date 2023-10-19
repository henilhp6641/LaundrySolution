import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ft_washing_app/widgets/error_sheet.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController forgotPasswordController = TextEditingController();
  RxString passwordString = "".obs;

  void resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ErrorSheet.showErrorSheet("Password reset email sent!", onTap: () {
        Get.back();
        Get.back();
      });

    } catch (error) {
      ErrorSheet.showErrorSheet('Error sending password reset email');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:ft_washing_app/components/common_appbar.dart';
import 'package:ft_washing_app/module/bottom/profile/change_password/change_password_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final changePasswordController =
      Get.put<ChangePasswordController>(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: ConstString.changePassword,
          isShowBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => InputField(
                    prefixIcon: const Visibility(
                      visible: true,
                      child: Icon(
                        Icons.lock_outline,
                        color: AppColor.primary,
                      ),
                    ),
                    controller: changePasswordController.oldPasswordController,
                    hint: ConstString.enterOldPass,
                    onChange: (value) {
                      changePasswordController.oldPasswordString.value =
                          value ?? "";
                      changePasswordController.updateRegistrationValidity();
                    },
                    maxLine: 1,
                    obscureText: !changePasswordController.oldPass.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordController.oldPass.value =
                            !changePasswordController.oldPass.value;
                      },
                      child: Icon(
                        changePasswordController.oldPass.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: changePasswordController.oldPass.value
                            ? AppColor.primary
                            : AppColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => InputField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter password';
                      } else if (val.length < 6) {  // Assuming a minimum password length of 6 characters
                        return 'Password should be at least 6 characters long';
                      }
                      return null;
                    },
                    prefixIcon: const Visibility(
                      visible: true,
                      child: Icon(
                        Icons.lock_outline,
                        color: AppColor.primary,
                      ),
                    ),
                    controller: changePasswordController.newPasswordController,
                    hint: ConstString.enterNewPass,
                    onChange: (value) {
                      changePasswordController.newPasswordString.value =
                          value ?? "";
                      changePasswordController.updateRegistrationValidity();
                    },
                    maxLine: 1,
                    obscureText: !changePasswordController.newPass.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordController.newPass.value =
                            !changePasswordController.newPass.value;
                      },
                      child: Icon(
                        changePasswordController.newPass.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: changePasswordController.newPass.value
                            ? AppColor.primary
                            : AppColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => InputField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please confirm password';
                      } else if (val != changePasswordController.newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    prefixIcon: const Visibility(
                      visible: true,
                      child: Icon(
                        Icons.lock_outline,
                        color: AppColor.primary,
                      ),
                    ),
                    controller:
                        changePasswordController.confirmPasswordController,
                    hint: ConstString.enterConfirmPass,
                    onChange: (value) {
                      changePasswordController.confirmPasswordString.value =
                          value ?? "";
                      changePasswordController.updateRegistrationValidity();
                    },
                    maxLine: 1,
                    obscureText: !changePasswordController.confirmPass.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordController.confirmPass.value =
                            !changePasswordController.confirmPass.value;
                      },
                      child: Icon(
                        changePasswordController.confirmPass.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: changePasswordController.confirmPass.value
                            ? AppColor.primary
                            : AppColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => CommonAppButton(
                    buttonType:
                        changePasswordController.isRegistrationValid.value
                            ? ButtonType.enable
                            : ButtonType.disable,
                    text: ConstString.changePassword,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      changePasswordController.changePassword(
                        changePasswordController.oldPasswordString.value,
                        changePasswordController.confirmPasswordString.value,
                      );
                      // Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

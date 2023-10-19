import 'package:ft_washing_app/module/register/register_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/images.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerController = Get.put<RegisterController>(RegisterController());

  ///pick from galley
  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      registerController.image = pickedFile;
      setState(() {});
    }
  }

  ///pick from camera
  Future<void> captureImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      registerController.image = pickedFile;
      setState(() {});
    }
  }

  ///ask for choose image source
  Future<void> _showImagePickerDialog(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text(ConstString.selectImageSource),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back();

                pickImageFromGallery();
              },
              child: const Text(ConstString.pickFromGallery),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back();

                captureImageFromCamera();
              },
              child: const Text(ConstString.captureFromCamera),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            child: const Text(ConstString.cancel),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CommonAppBar(
          appBar: AppBar(),
        ),
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ConstString.createAccount,
                      style: const TextStyle()
                          .normal36Bold
                          .textColor(AppColor.primary),
                    ),
                    Text(
                      ConstString.plsEnterDtl,
                      style: const TextStyle()
                          .normal16w400
                          .textColor(AppColor.gray400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    registerController.image == null
                        ? ClipOval(
                            child: Image.asset(
                              profileIcon,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipOval(
                            child: Image.file(
                              File(registerController.image?.path ?? ""),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                    GestureDetector(
                      onTap: () {
                        _showImagePickerDialog(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColor.primary),
                        child: const Icon(
                          Icons.add,
                          color: AppColor.white,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                InputField(
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                  controller: registerController.firstNameController,
                  hint: ConstString.firstName,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onChange: (value) {
                    registerController.firstNameString.value = value ?? "";
                    registerController.updateRegistrationValidity();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                  controller: registerController.lastNameController,
                  hint: ConstString.lastName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  onChange: (value) {
                    registerController.lastNameString.value = value ?? "";
                    registerController.updateRegistrationValidity();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return ConstString.pleaseEnterEmail;
                    } else if (!(ValidationUtils.validateEmail(
                        registerController.emailString.value))) {
                      return ConstString.pleaseEnterValidEmail;
                    }
                  },
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.email_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                  controller: registerController.emailController,
                  hint: ConstString.enterEmail,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: const Visibility(
                      visible: false, child: Icon(Icons.email_outlined)),
                  onChange: (value) {
                    registerController.emailString.value = value ?? "";
                    registerController.updateRegistrationValidity();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return ConstString.pleaseEnterMobileNumber;
                    } else if (val!.length != 10) {
                      return ConstString.invalidMobileNumber;
                    }
                  },
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.phone_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                  controller: registerController.phoneNumberController,
                  hint: ConstString.enterPhoneNumber,
                  keyboardType: TextInputType.phone,
                  onChange: (value) {
                    registerController.phoneString.value = value ?? "";
                    registerController.updateRegistrationValidity();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  readOnly: true,
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.calendar_month,
                      color: AppColor.primary,
                    ),
                  ),
                  controller: registerController.dobController,
                  hint: ConstString.dob,
                  keyboardType: TextInputType.phone,
                  onTap: () {
                    registerController.selectDatePicker(context);
                  },
                  onChange: (value) {
                    registerController.updateRegistrationValidity();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.man_outlined,
                      color: AppColor.primary,
                      size: 25,
                    ),
                  ),
                  controller: registerController.ageController,
                  hint: ConstString.age,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  onChange: (value) {
                    registerController.ageString.value = value ?? "";
                    registerController.updateRegistrationValidity();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            registerController.gender.value = ConstString.male;
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: registerController.gender.value ==
                                        ConstString.male
                                    ? AppColor.primary
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.primary.withOpacity(0.06),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.primary),
                                  value: ConstString.male,
                                  groupValue: registerController.gender.value,
                                  onChanged: (val) {
                                    registerController.gender.value = val ?? "";
                                  },
                                ),
                                Text(
                                  ConstString.male,
                                  style: const TextStyle().normal16w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            registerController.gender.value =
                                ConstString.female;
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.primary.withOpacity(0.06),
                              border: Border.all(
                                width: 1,
                                color: registerController.gender.value ==
                                        ConstString.female
                                    ? AppColor.primary
                                    : Colors.transparent,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.primary),
                                  value: ConstString.female,
                                  groupValue: registerController.gender.value,
                                  onChanged: (val) {
                                    registerController.gender.value = val ?? "";
                                  },
                                ),
                                Text(
                                  ConstString.female,
                                  style: const TextStyle().normal16w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                    controller: registerController.passwordController,
                    hint: ConstString.enterPassword,
                    onChange: (value) {
                      registerController.passwordString.value = value ?? "";
                      registerController.updateRegistrationValidity();
                    },
                    maxLine: 1,
                    obscureText: !registerController.showPass.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        registerController.showPass.value =
                            !registerController.showPass.value;
                      },
                      child: Icon(
                        registerController.showPass.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: registerController.showPass.value
                            ? AppColor.primary
                            : AppColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => InputField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please confirm password';
                      } else if (val != registerController.passwordController.text) {
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
                    onChange: (val) {
                      registerController.confirmPasswordString.value =
                          val ?? "";
                      registerController.updateRegistrationValidity();
                    },
                    obscureText: !registerController.showConfirmPassword.value,
                    maxLine: 1,
                    hint: ConstString.enterConfirmPassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        registerController.showConfirmPassword.value =
                            !registerController.showConfirmPassword.value;
                      },
                      child: Icon(
                        registerController.showConfirmPassword.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: registerController.showConfirmPassword.value
                            ? AppColor.primary
                            : AppColor.primary,
                      ),
                    ),
                    controller: registerController.confirmPasswordController,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Obx(
                  () => CommonAppButton(
                    buttonType: registerController.isRegistrationValid.value
                        ? ButtonType.enable
                        : ButtonType.disable,
                    text: ConstString.register,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      registerController.registerUser();
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

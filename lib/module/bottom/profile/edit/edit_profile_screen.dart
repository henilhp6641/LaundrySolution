import 'package:flutter/material.dart';
import 'package:ft_washing_app/components/common_appbar.dart';
import 'package:ft_washing_app/module/bottom/profile/edit/edit_profile_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/images.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final editProfileController =
      Get.put<EditProfileController>(EditProfileController());

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      editProfileController.image = pickedFile;
      setState(() {});
    }
  }

  Future<void> captureImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      editProfileController.image = pickedFile;
      setState(() {});
    }
  }

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
        backgroundColor: AppColor.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: ConstString.editProfile,
          isShowBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    editProfileController.image == null
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
                              File(editProfileController.image?.path ?? ""),
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
                  height: 15,
                ),
                InputField(
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                  controller: editProfileController.firstNameController,
                  hint: ConstString.firstName,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onChange: (value) {
                    editProfileController.firstNameString.value = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                  controller: editProfileController.lastNameController,
                  hint: ConstString.lastName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  onChange: (value) {
                    editProfileController.lastNameString.value = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.email_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                  readOnly: true,
                  controller: editProfileController.emailController,
                  hint: ConstString.enterEmail,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: const Visibility(
                      visible: false, child: Icon(Icons.email_outlined)),
                  onChange: (value) {
                    editProfileController.emailString.value = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return ConstString.pleaseEnterMobileNumber;
                    } else if (!(val!.startsWith("+1") && val.length == 12)) {
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
                  controller: editProfileController.phoneNumberController,
                  hint: ConstString.enterPhoneNumber,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  onChange: (value) {
                    editProfileController.phoneString.value = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.app_registration,
                      color: AppColor.primary,
                    ),
                  ),
                  readOnly: true,

                  controller: editProfileController.registerController,
                  hint: ConstString.registerDate,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  onChange: (value) {
                    // editProfileController.ageString.value = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 15,
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
                  controller: editProfileController.ageController,
                  hint: ConstString.age,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  onChange: (value) {
                    editProfileController.ageString.value = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 15,
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
                  controller: editProfileController.dobController,
                  hint: ConstString.dob,
                  keyboardType: TextInputType.phone,
                  onTap: () {
                    editProfileController.selectDatePicker(context);
                  },
                  onChange: (value) {
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            editProfileController.gender.value =
                                ConstString.male;
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: editProfileController.gender.value ==
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
                                  groupValue:
                                      editProfileController.gender.value,
                                  onChanged: (val) {
                                    editProfileController.gender.value =
                                        val ?? "";
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
                            editProfileController.gender.value =
                                ConstString.female;
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.primary.withOpacity(0.06),
                              border: Border.all(
                                width: 1,
                                color: editProfileController.gender.value ==
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
                                  groupValue:
                                      editProfileController.gender.value,
                                  onChanged: (val) {
                                    editProfileController.gender.value =
                                        val ?? "";
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
                  height: 50,
                ),
                CommonAppButton(
                  buttonType: ButtonType.enable,
                  text: ConstString.editProfile,
                  onTap: () {
                    editProfileController.updateProfile();
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

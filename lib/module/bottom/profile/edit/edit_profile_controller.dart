import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/data/model/user_model.dart';
import 'package:ft_washing_app/module/bottom/profile/profile_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/firebase_string.dart';
import 'package:ft_washing_app/utils/images.dart';
import 'package:ft_washing_app/widgets/app_loader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  RxString firstNameString = "".obs;
  TextEditingController lastNameController = TextEditingController();
  RxString lastNameString = "".obs;

  TextEditingController emailController = TextEditingController();
  RxString emailString = "".obs;

  TextEditingController phoneNumberController = TextEditingController();
  RxString phoneString = "".obs;
  TextEditingController ageController = TextEditingController();
  RxString ageString = "".obs;
  RxString gender = ConstString.male.obs;
  var dateTime = DateTime.now().obs;
  TextEditingController dobController = TextEditingController();
  TextEditingController registerController = TextEditingController();

  RxString date = ''.obs;
  XFile? image;
  final profileController = Get.find<ProfileController>();

  void selectDatePicker(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dateTime.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      dateTime.value = pickedDate;
      dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  Future<void> updateProfile() async {
    showLoader();
    try {
      UserData userData = UserData(
        uid: AppPref().uid,
        firstName: firstNameString.value,
        lastName: lastNameString.value,
        email: emailString.value.trim(),
        mobileNumber: phoneString.value,
        dateOfBirth: dobController.text,
        age: int.parse(ageString.value),
        gender: gender.value,
      );

      FirebaseFirestore.instance
          .collection(FirebaseString.users)
          .doc(AppPref().uid)
          .update(userData.toMap());
      // await profileController.fetchData();
      dismissLoader();
      Get.back();
    } catch (e) {
      dismissLoader();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    firstNameController.text =
        profileController.userData.value?.firstName ?? "";
    firstNameString.value = profileController.userData.value?.firstName ?? "";

    lastNameController.text = profileController.userData.value?.lastName ?? "";
    lastNameString.value = profileController.userData.value?.lastName ?? "";

    emailController.text = profileController.userData.value?.email ?? "";
    emailString.value = profileController.userData.value?.email ?? "";

    phoneNumberController.text =
        profileController.userData.value?.mobileNumber ?? "";
    phoneString.value = profileController.userData.value?.mobileNumber ?? "";

    registerController.text =
        profileController.userData.value?.registerDate ?? "";

    ageController.text = profileController.userData.value?.age.toString() ?? "";
    ageString.value = profileController.userData.value?.age.toString() ?? "";

    dateTime.value =
        DateTime.parse(profileController.userData.value?.dateOfBirth ?? "");
    dobController.text = DateFormat('yyyy-MM-dd').format(dateTime.value);

    gender.value = profileController.userData.value?.gender ?? "";
    super.onInit();
  }
}

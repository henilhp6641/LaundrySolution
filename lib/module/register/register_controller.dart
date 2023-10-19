import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ft_washing_app/data/model/user_model.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/firebase_string.dart';
import 'package:ft_washing_app/widgets/app_loader.dart';
import 'package:ft_washing_app/widgets/error_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  RxString firstNameString = "".obs;
  TextEditingController lastNameController = TextEditingController();
  RxString lastNameString = "".obs;
  TextEditingController emailController = TextEditingController();
  RxString emailString = "".obs;
  TextEditingController phoneNumberController = TextEditingController();
  RxString phoneString = "".obs;
  TextEditingController passwordController = TextEditingController();
  RxString passwordString = "".obs;
  TextEditingController confirmPasswordController = TextEditingController();
  RxString confirmPasswordString = ''.obs;
  TextEditingController dobController = TextEditingController();
  RxString ageString = "".obs;
  TextEditingController ageController = TextEditingController();
  XFile? image;
  RxBool isRegistrationValid = RxBool(false);
  RxBool showPass = false.obs;
  RxBool showConfirmPassword = false.obs;
  RxBool isRememberUsername = false.obs;
  RxBool isStayLogin = false.obs;
  var dateTime = DateTime.now().obs;
  RxString gender = ConstString.male.obs;
  RxString date = ''.obs;

  void selectDatePicker(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dateTime.value,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dateTime.value = pickedDate;
      dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }


  void updateRegistrationValidity() {
    isRegistrationValid.value = passwordString.value.isNotEmpty &&
        confirmPasswordString.value.isNotEmpty &&
        ageString.value.isNotEmpty &&
        firstNameString.value.isNotEmpty &&
        lastNameString.value.isNotEmpty &&
        (confirmPasswordString.value == passwordString.value);
  }

  Future<void> registerUser() async {
    showLoader();
    try {
      if (image != null) {
        ///createUserWithEmailAndPassword
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailString.value.trim(),
          password: confirmPasswordString.value.trim(),
        );
        final imageFile = File(image?.path ?? "");
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('${FirebaseString.user_profile_images}${credential.user?.uid}');
        final uploadTask = storageRef.putFile(imageFile);

        final imageSnapshot = await uploadTask;
        final imageUrl = await imageSnapshot.ref.getDownloadURL();
        UserData userData = UserData(
          uid: credential.user?.uid ?? "",
          firstName: firstNameString.value,
          lastName: lastNameString.value,
          email: emailString.value.trim(),
          mobileNumber: phoneString.value,
          dateOfBirth: dobController.text,
          age: int.parse(ageString.value),
          gender: gender.value,
          image: imageUrl,
          registerDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        );
        await credential.user?.sendEmailVerification();
        final userDocRef = FirebaseFirestore.instance
            .collection(FirebaseString.users)
            .doc(credential.user?.uid);
        await userDocRef.set(userData.toMap());
        AppPref().uid = credential.user?.uid ?? "";
        dismissLoader();
        Get.offAllNamed(AppRouter.emailVerification);
      } else {
        dismissLoader();

        ErrorSheet.showErrorSheet(ConstString.pleaseSelectProfileImage);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == ConstString.weakpassword) {
        dismissLoader();

        ErrorSheet.showErrorSheet(ConstString.passwordweak);
      } else if (e.code == ConstString.emailalreadyinuse) {
        dismissLoader();
        ErrorSheet.showErrorSheet(ConstString.accountalreadyexistsemail);
      }
    } catch (e) {
      dismissLoader();

      ErrorSheet.showErrorSheet(e.toString());
    }
  }
}

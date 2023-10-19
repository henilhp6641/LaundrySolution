import 'package:firebase_auth/firebase_auth.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/widgets/app_loader.dart';
import 'package:ft_washing_app/widgets/error_sheet.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  RxString oldPasswordString = "".obs;
  RxBool oldPass = false.obs;

  TextEditingController newPasswordController = TextEditingController();
  RxString newPasswordString = "".obs;
  RxBool newPass = false.obs;

  TextEditingController confirmPasswordController = TextEditingController();
  RxString confirmPasswordString = "".obs;
  RxBool confirmPass = false.obs;

  RxBool isRegistrationValid = RxBool(false);

  // void changePassword(String currentPassword, String newPassword) async {
  //   final user =  FirebaseAuth.instance.currentUser;
  //   try{
  //     final cred = EmailAuthProvider.credential(
  //         email: "deep@yopmail.com", password: currentPassword);
  //     print(cred);
  //     user?.reauthenticateWithCredential(cred).then((value) {
  //       user.updatePassword(newPassword).then((_) {
  //         ErrorSheet.showErrorSheet("Password changed",onTap: (){
  //           Get.back();
  //           Get.back();
  //         });
  //       }).catchError((error) {
  //         ErrorSheet.showErrorSheet("Error while changing password");
  //
  //       });
  //     }).catchError((err) {});
  //   }catch(e){
  //     ErrorSheet.showErrorSheet(e.toString());
  //
  //   }
  // }

  void changePassword(String oldPassword, String newPassword) async {
    showLoader();

    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? currentUser = firebaseAuth.currentUser;
    AuthCredential credential = EmailAuthProvider.credential(
      email: currentUser?.email ?? '', // Use the user's email here.
      password: oldPassword,
    );

    try {
      await currentUser?.reauthenticateWithCredential(credential);

      await currentUser?.updatePassword(newPassword);
      dismissLoader();

      confirmPasswordController.clear();
      newPasswordController.clear();
      oldPasswordController.clear();
      oldPasswordString.value = "";
      newPasswordString.value = "";
      confirmPasswordString.value = "";
      ErrorSheet.showErrorSheet("Successfully changed password", onTap: () {
        Get.back();
        Get.back();
      });
    } catch (error) {
      dismissLoader();

      ErrorSheet.showErrorSheet("Password can't be changed");
    }
  }

  void updateRegistrationValidity() {
    isRegistrationValid.value = oldPasswordString.value.isNotEmpty &&
        (newPasswordController.value == confirmPasswordController.value);
  }
}

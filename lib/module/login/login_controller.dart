import 'package:firebase_auth/firebase_auth.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/widgets/app_loader.dart';
import 'package:ft_washing_app/widgets/error_sheet.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString emailString = "".obs;
  RxString passwordString = "".obs;
  RxBool showPass = false.obs;
  RxBool isRememberUsername = false.obs;
  RxBool isStayLogin = false.obs;

  final _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {

    showLoader();

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: emailString.value.trim(),
        password: passwordString.value.trim(),
      );
      if (credential.user?.emailVerified == false) {
        dismissLoader();

        Get.toNamed(AppRouter.emailVerification);
      } else {
        dismissLoader();
        AppPref().uid = credential.user?.uid??"";

        Get.offAllNamed(AppRouter.bottomBar);

      }
      dismissLoader();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        dismissLoader();
        ErrorSheet.showErrorSheet("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        dismissLoader();
        ErrorSheet.showErrorSheet("Wrong password provided for that user.");
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        dismissLoader();
        ErrorSheet.showErrorSheet("Invalid Credentials");
      }
    }
  }
}

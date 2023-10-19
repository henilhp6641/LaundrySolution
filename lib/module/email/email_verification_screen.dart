import 'package:firebase_auth/firebase_auth.dart';

import 'package:ft_washing_app/module/email/email_verification_controller.dart';

import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/images.dart';

import '../../package/config_packages.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final emailVerificationController =
      Get.put<EmailVerificationController>(EmailVerificationController());

  @override
  void initState() {
    super.initState();
    emailVerificationController.timer =
        Timer.periodic(const Duration(seconds: 1), (timer) async {
      User? user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      if (user?.emailVerified == true) {

        Get.offAllNamed(AppRouter.bottomBar);

        emailVerificationController.timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailVerificationController.timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                emailVerification,
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              ConstString.emailVerification,
              style: const TextStyle().normal24w600.textColor(AppColor.primary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

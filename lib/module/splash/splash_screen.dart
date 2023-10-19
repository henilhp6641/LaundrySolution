import 'package:firebase_auth/firebase_auth.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import '../../utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  goNextScreen() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (user == null || user?.emailVerified == false) {
        Get.offAllNamed(AppRouter.login);
      } else {
        Get.offAllNamed(AppRouter.bottomBar);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(
          logo,
          height: 200,
        ),
      ),
    );
  }
}

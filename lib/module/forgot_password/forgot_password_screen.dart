

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ft_washing_app/module/forgot_password/forgot_password_controller.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/widgets/error_sheet.dart';

import '../../package/config_packages.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotPasswordController = Get.put<ForgotPasswordController>(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ConstString.recoverPassword,
                style: const TextStyle()
                    .normal32Bold
                    .textColor(AppColor.primary),
              ),
              const SizedBox(
                height: 50,
              ),
              InputField(
                prefixIcon: const Visibility(
                  visible: true,
                  child: Icon(
                    Icons.email_outlined,
                    color: AppColor.primary,
                  ),
                ),
                controller: forgotPasswordController.forgotPasswordController,
                hint: ConstString.enterEmail,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: const Visibility(
                    visible: false, child: Icon(Icons.email_outlined)),
                onChange: (value) {
                  forgotPasswordController.passwordString.value = value ?? "";
                },
              ),
              const SizedBox(height: 25,),
              Obx(
                    () => CommonAppButton(
                  buttonType: forgotPasswordController.passwordString.value.isEmpty
                      ? ButtonType.disable

                      : !ValidationUtils.validateEmail(
                      forgotPasswordController.passwordString.value)
                      ? ButtonType.disable
                      : ButtonType.enable,
                  text: ConstString.forgotpassword,
                  onTap: () {
                    FocusScope.of(context).unfocus();

                    forgotPasswordController.resetPassword(forgotPasswordController.forgotPasswordController.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

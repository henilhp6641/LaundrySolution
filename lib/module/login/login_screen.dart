import 'package:ft_washing_app/components/constant.dart';
import 'package:ft_washing_app/module/login/login_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put<LoginController>(LoginController());

  @override
  void initState() {
    super.initState();
    loginController.isStayLogin.value = AppPref().login;
    loginController.emailController.text = AppPref().remember;
    loginController.emailString.value = AppPref().remember;

    AppPref().remember == ''
        ? loginController.isRememberUsername.value = false
        : loginController.isRememberUsername.value = true;
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
          isShowBackButton: false,
        ),
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ConstString.welcomeBack,
                      style: TextStyle(fontFamily: Constant.jakartaBold)
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
                  height: 50,
                ),
                InputField(
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Please enter Email";
                    } else if (!(ValidationUtils.validateEmail(
                        loginController.emailString.value))) {
                      return "Invalid Email";
                    }
                  },
                  controller: loginController.emailController,
                  hint: ConstString.enterEmail,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.email_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                  onChange: (value) {
                    loginController.emailString.value = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => InputField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    controller: loginController.passwordController,
                    hint: ConstString.enterPassword,
                    prefixIcon: const Visibility(
                      visible: true,
                      child: Icon(
                        Icons.lock_outline,
                        color: AppColor.primary,
                      ),
                    ),
                    onChange: (value) {
                      loginController.passwordString.value = value ?? "";
                    },
                    maxLine: 1,
                    obscureText: !loginController.showPass.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginController.showPass.value =
                            !loginController.showPass.value;
                      },
                      child: Icon(
                        loginController.showPass.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: loginController.showPass.value
                            ? AppColor.primary
                            : AppColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouter.forgotPasswordScreen);
                    },
                    child: Text(
                      ConstString.forgotPassword,
                      style: const TextStyle()
                          .normal16w500
                          .textColor(AppColor.primary),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      loginController.isRememberUsername.value =
                          !loginController.isRememberUsername.value;
                    },
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1,
                          child: Theme(
                            data: ThemeData(
                              primarySwatch: Colors.blue,
                              unselectedWidgetColor: AppColor.gray300,
                              // Your color
                            ),
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                hoverColor: AppColor.primary,
                                focusColor: AppColor.primary,
                                checkColor: Colors.white,
                                value: loginController.isRememberUsername.value,
                                onChanged: (bool? value) {
                                  loginController.isRememberUsername.value =
                                      value!;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          ConstString.rememberUsername,
                          style: const TextStyle()
                              .normal16w400
                              .textColor(AppColor.gray600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      loginController.isStayLogin.value =
                          !loginController.isStayLogin.value;
                    },
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1,
                          child: Theme(
                            data: ThemeData(
                              primarySwatch: Colors.blue,
                              unselectedWidgetColor: AppColor.gray300,
                              // Your color
                            ),
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                hoverColor: AppColor.primary,
                                focusColor: AppColor.primary,
                                checkColor: Colors.white,
                                value: loginController.isStayLogin.value,
                                onChanged: (bool? value) {
                                  loginController.isStayLogin.value = value!;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          ConstString.stayLoggedIn,
                          style: const TextStyle()
                              .normal16w400
                              .textColor(AppColor.gray600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(
                  () => CommonAppButton(
                    buttonType: loginController.emailString.value.isEmpty
                        ? ButtonType.disable
                        : loginController.passwordString.value.isEmpty
                            ? ButtonType.disable
                            : !ValidationUtils.validateEmail(
                                    loginController.emailString.value)
                                ? ButtonType.disable
                                : ButtonType.enable,
                    text: ConstString.login,
                    onTap: () {
                      // Get.toNamed(AppRouter.bottomBar);
                      FocusScope.of(context).unfocus();

                      loginController.loginUser();
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouter.register);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: ConstString.youDoNotHaveAccount,
                        style: const TextStyle()
                            .normal16w500
                            .textColor(AppColor.gray600),
                        children: <TextSpan>[
                          TextSpan(
                            text: ConstString.register,
                            style: const TextStyle().normal16w600.textColor(
                                  AppColor.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
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

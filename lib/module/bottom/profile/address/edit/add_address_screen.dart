import 'package:ft_washing_app/module/bottom/profile/address/edit/add_address_controller.dart';
import 'package:ft_washing_app/utils/const_string.dart';

import '../../../../../package/config_packages.dart';
import '../all_address_controller.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final editAddressController =
      Get.put<AddAddressController>(AddAddressController());
  final allAddressController =
  Get.put<AllAddressController>(AllAddressController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CommonAppBar(
          appBar: AppBar(),
          isShowBackButton: true,
          title: ConstString.addAddress,
        ),
        backgroundColor: AppColor.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return ConstString.add1NotEmpty;
                      }
                    },
                    controller: editAddressController.address1Controller,
                    hint: ConstString.enterAddress1,
                    keyboardType: TextInputType.name,
                    onChange: (value) {
                      editAddressController.address1String.value = value ?? "";
                      // registerController.updateRegistrationValidity();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return ConstString.add2NotEmpty;
                      }
                    },
                    controller: editAddressController.address2Controller,
                    hint: ConstString.enterAddress2,
                    keyboardType: TextInputType.name,
                    onChange: (value) {
                      editAddressController.address2String.value = value ?? "";
                      // registerController.updateRegistrationValidity();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return ConstString.countryNotEmpty;
                      }
                    },
                    controller: editAddressController.countryController,
                    hint: ConstString.enterCountry,
                    keyboardType: TextInputType.name,
                    onChange: (value) {
                      editAddressController.countryString.value = value ?? "";
                      // registerController.updateRegistrationValidity();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return ConstString.cityNotEmpty;
                      }
                    },
                    controller: editAddressController.cityController,
                    hint: ConstString.enterCity,
                    keyboardType: TextInputType.name,
                    onChange: (value) {
                      editAddressController.cityString.value = value ?? "";
                      // registerController.updateRegistrationValidity();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return ConstString.postalNotEmpty;
                      }
                    },
                    controller: editAddressController.postalCodeController,
                    hint: ConstString.enterPostalCode,
                    keyboardType: TextInputType.number,
                    onChange: (value) {
                      editAddressController.postalCodeString.value =
                          value ?? "";
                      // registerController.updateRegistrationValidity();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        editAddressController.setDefault.value =
                            !editAddressController.setDefault.value;
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
                                  value: editAddressController.setDefault.value,
                                  onChanged: (bool? value) {
                                    editAddressController.setDefault.value =
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
                            ConstString.setDefaultAddress,
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
                  CommonAppButton(
                    buttonType: ButtonType.enable,
                    text: ConstString.set,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        editAddressController.addAddress();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ft_washing_app/module/bottom/profile/address/all_address_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

import '../my_profile/my_profile_controller.dart';

class AllAddressScreen extends StatefulWidget {
  const AllAddressScreen({super.key});

  @override
  State<AllAddressScreen> createState() => _AllAddressScreenState();
}

class _AllAddressScreenState extends State<AllAddressScreen> {
  final allAddressController =
      Get.put<AllAddressController>(AllAddressController());

  final myProfileController =
  Get.put<MyProfileController>(MyProfileController());

  void openDialog(index) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(ConstString.deleteAddressMessage),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Get.back();
                },
                child: const Text(ConstString.no),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  allAddressController.deleteAddress(index);
                  Get.back();
                },
                child: const Text(ConstString.yes),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        isShowBackButton: true,
        title: ConstString.addresses,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRouter.editAddressScreen);
              },
              icon: const Icon(
                Icons.add,
                color: AppColor.gray800,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.white,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                if (allAddressController.showProgress.value)
                  const Center(child: CircularProgressIndicator())
                else if (allAddressController.addresses.isEmpty)
                  const Center(child: Text('No Addresses Found')) // You can style this text according to your needs.
                else
                ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 20),
                        shrinkWrap: true,
                        itemCount: allAddressController.addresses.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.primary,
                                width: 1,
                              ),
                              color: AppColor.primary.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          allAddressController.addresses[index]
                                              ['address1'],
                                          style: const TextStyle().normal18w600,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColor.primary,
                                          ),
                                          child: Text(
                                            "Home",
                                            style: const TextStyle()
                                                .normal14w500
                                                .textColor(AppColor.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        // GestureDetector(
                                        //   onTap: () {
                                        //     Get.toNamed(
                                        //         AppRouter.editAddressScreen);
                                        //   },
                                        //   child: ClipOval(
                                        //     child: Container(
                                        //       padding: const EdgeInsets.all(8),
                                        //       color: AppColor.primary,
                                        //       child: const Icon(
                                        //         Icons.edit,
                                        //         size: 22,
                                        //         color: AppColor.white,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        // const SizedBox(
                                        //   width: 10,
                                        // ),
                                        GestureDetector(
                                          onTap: () {
                                            openDialog(index);
                                          },
                                          child: ClipOval(
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              color: AppColor.primary,
                                              child: const Icon(
                                                Icons.delete,
                                                size: 22,
                                                color: AppColor.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  allAddressController.addresses[index]
                                      ['address2'],
                                  style: const TextStyle().normal16w400,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${allAddressController.addresses[index]['city']}, ${allAddressController.addresses[index]['country']}, ${allAddressController.addresses[index]['postalCode']}",
                                  style: const TextStyle().normal16w400,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ft_washing_app/module/bottom/profile/profile_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

import 'my_profile_controller.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final profileController = Get.find<ProfileController>();

  final myProfileController =
      Get.put<MyProfileController>(MyProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      myProfileController.fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        centerTitle: true,
        title: ConstString.myProfile,
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 40),
              child: myProfileController.profile.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.primary.withOpacity(0.06),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ClipOval(
                            child: Image.network(
                              myProfileController.profile[0]['image'],
                              width: 100.0, // width of the circle
                              height: 100.0, // height of the circle
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        MyProfileWidget(
                          title: ConstString.firstName,
                          value: myProfileController.profile[0]
                              ['firstName'],
                        ),
                        const MyDivider(),
                        MyProfileWidget(
                          title: ConstString.lastName,
                          value: myProfileController.profile[0]['lastName'],
                        ),
                        const MyDivider(),
                        MyProfileWidget(
                          title: ConstString.email,
                          value: myProfileController.profile[0]['email'],
                        ),
                        const MyDivider(),
                        MyProfileWidget(
                          title: ConstString.phoneNumber,
                          value: myProfileController.profile[0]['mobileNumber'],
                        ),
                        const MyDivider(),
                        MyProfileWidget(
                          title: ConstString.gender,
                          value: myProfileController.profile[0]['gender'],
                        ),
                        const MyDivider(),
                        MyProfileWidget(
                          title: ConstString.age,
                          value:
                              myProfileController.profile[0]['age'].toString(),
                        ),
                        const MyDivider(),
                        MyProfileWidget(
                          title: ConstString.registerDate,
                          value: myProfileController.profile[0]['registerDate'],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(
        thickness: 1,
      ),
    );
  }
}

class MyProfileWidget extends StatelessWidget {
  MyProfileWidget({
    super.key,
    required this.title,
    required this.value,
  });

  String? title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: const TextStyle().normal20w600.textColor(AppColor.gray600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value ?? "",
          style: const TextStyle().normal18w600,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ft_washing_app/components/common_appbar.dart';
import 'package:ft_washing_app/module/bottom/home/bag/our_plan_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/images.dart';
import 'package:get/get.dart';

import '../../profile/my_plans/my_plans_controller.dart';
import 'our_plan_checkout_screen.dart';

class OurPlanScreen extends StatefulWidget {
  const OurPlanScreen({super.key});

  @override
  State<OurPlanScreen> createState() => _OurPlanScreenState();
}

class _OurPlanScreenState extends State<OurPlanScreen> {
  final monthlyBagController = Get.put<OurPlanController>(OurPlanController());
  final myPlanController = Get.put<MyPlanController>(MyPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        isShowBackButton: true,
        title: ConstString.ourPlan,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text("Notes: User only able to subscribe single plan!",
                  style: const TextStyle()
                      .normal16w400
                      .bold
                      .textColor(Colors.black)),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemCount: monthlyBagController.list.length,
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
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              laundryBag,
                              height: 150,
                            ),
                            Text(
                              monthlyBagController.list[index]['weight'],
                              style: const TextStyle().normal32Bold,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                monthlyBagController.list[index]['title'],
                                style: const TextStyle().normal18w600,
                                // overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "\$ ${monthlyBagController.list[index]['price'].toString()}",
                                style: const TextStyle()
                                    .normal20w600
                                    .textColor(AppColor.primary),
                              ),
                              Text(
                                "Tax included Amount",
                                style: const TextStyle().normal14w400,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.primary,
                                ),
                                child: CommonAppButton(
                                  buttonType: ButtonType.enable,
                                  text: "Checkout",
                                  onTap: () {
                                    FocusScope.of(context).unfocus();

                                    // if (monthlyBagController.list[index]
                                    //         ['status'] ==
                                    //     "Active") {
                                    //   const AlertDialog(
                                    //     content: Column(
                                    //       mainAxisSize: MainAxisSize.min,
                                    //       children: [
                                    //         Row(
                                    //           children: [
                                    //             Text("You only able to subscribe single plan!"),
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   );
                                    //
                                    // } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OurPlanCheckOutScreen(
                                              index: index,
                                            ),
                                          ));
                                    }
                                    // Get.toNamed(AppRouter.ourPlanCheckOutScreen);
                                  // },
                                ),
                              )
                            ],
                          ),
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
    );
  }
}

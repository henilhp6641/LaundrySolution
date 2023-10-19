import 'package:ft_washing_app/module/bottom/profile/my_plans/my_plans_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/images.dart';

import '../../home/bag/our_plan_checkout_screen.dart';
import '../../home/bag/our_plan_controller.dart';

class MyPlansScreen extends StatefulWidget {
  const MyPlansScreen({super.key});

  @override
  State<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends State<MyPlansScreen> {
  final myPlanController = Get.put<MyPlanController>(MyPlanController());
  final monthlyBagController = Get.put<OurPlanController>(OurPlanController());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     for (int i = 0; i < monthlyBagController.list.length; i++) {
  //       if (monthlyBagController.list[i]['status'] == "Active") {
  //         myPlanController.isActive = true;
  //       }
  //     }
  //     print("BOOL IS ${myPlanController.isActive}");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        isShowBackButton: true,
        title: "My Plan",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (context, i) {
                return Obx(
                  () => Column(
                    children: [
                      (myPlanController.plan.isEmpty)
                          ? const CircularProgressIndicator()
                          : Container(
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
                                      Obx(
                                        () => Text(
                                          myPlanController.plan['planWeight'],
                                          style: const TextStyle().normal32Bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(
                                          () => Text(
                                            myPlanController.plan['planTitle'],
                                            style:
                                                const TextStyle().normal18w600,
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Obx(
                                          () => Text(
                                            "\$ ${myPlanController.plan['planPrice'].toString()}",
                                            style: const TextStyle()
                                                .normal20w600
                                                .textColor(AppColor.primary),
                                          ),
                                        ),
                                        Text(
                                          "Tax included Amount",
                                          style: const TextStyle().normal14w400,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Obx(
                                          () => Text(
                                              myPlanController.plan['planStatus'].toString(),
                                              style: const TextStyle()
                                                  .normal20w600
                                                  .bold
                                                  .textColor(
                                                      AppColor.primaryGreen)),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

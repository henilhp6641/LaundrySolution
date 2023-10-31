import 'package:ft_washing_app/module/bottom/profile/my_plans/my_plans_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/images.dart';
import '../../../../utils/const_string.dart';
import '../../home/bag/our_plan_controller.dart';

class MyPlansScreen extends StatefulWidget {
  const MyPlansScreen({super.key});

  @override
  State<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends State<MyPlansScreen> {
  final myPlanController = Get.put<MyPlanController>(MyPlanController());
  final monthlyBagController = Get.put<OurPlanController>(OurPlanController());

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
                      if (myPlanController.showProgress.value)
                        const CircularProgressIndicator()
                      else if (myPlanController.plan.isEmpty)
                        const Text('No Active Plan') // You can style this text according to your needs.
                      else
                        Container(
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
                                            "\$ ${myPlanController.plan['planPrice'].toString()}/month",
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
                                          () => Row(
                                            children: [
                                              Text(
                                                  myPlanController.plan['planStatus'].toString(),
                                                  style: const TextStyle()
                                                      .normal20w600
                                                      .bold
                                                      .textColor(
                                                          AppColor.primaryGreen)),

                                            ],
                                          ),
                                        ),
                                        Obx(
                                          ()=> Text(
                                              "(Expire on ${
                                                  myPlanController
                                                      .plan['planLastDate']
                                                      .toString()
                                              })",
                                              style: const TextStyle()
                                                  .size(16)
                                                  .textColor(
                                                  AppColor.primary)),
                                        ),
                                      ],
                                    ),
                                  ),   GestureDetector(
                                    onTap: () {
                                      openDialog();
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
                              ),
                            ),

                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  void openDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(ConstString.deletePlanMessage),
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
                  myPlanController.deletePlan();
                   Get.back();
                },
                child: const Text(ConstString.yes),
              ),
            ],
          );
        });
  }
}

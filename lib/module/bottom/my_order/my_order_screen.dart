import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ft_washing_app/module/bottom/my_order/my_order_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {


  final myOrderController = Get.put<MyOrderController>(MyOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        isShowBackButton: false,
        appBar: AppBar(),
        title: ConstString.myOrders,
      ),
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount:
                myOrderController.order.length, //databaseReference.snapshot.value.map['order'].toInt(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.primary.withOpacity(0.06),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Laundry",
                          style: const TextStyle()
                              .normal20wBold
                              .textColor(AppColor.primary),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        NewWidget(
                          title: "Order Number",
                          value:  myOrderController.order[index]
                          ['orderNumber'].toString()//(index+1).toString()//"OHJ8768GG",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        NewWidget(
                          title: "Order Date",
                          value:  myOrderController.order[index]
                          ['orderDate']//"2022-09-14 14:14:41",
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        NewWidget(
                            title: "Expected Pickup Date",
                            value:  myOrderController.order[index]
                            ['orderPickUpDate']//"2022-09-14 14:14:41",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        NewWidget(
                          title: "Status",
                          value: myOrderController.order[index]
                          ['orderStatus'],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.primary.withOpacity(0.09),
                          ),
                          child: Column(
                            children: [
                              NewWidget(
                                title: "Items",
                                value: "\$ ${myOrderController.order[index]
                                ['orderSpent'].toString()}",
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              NewWidget(
                                title: "Delivery charges",
                                value: "\$0",
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              NewWidget(
                                title: "Total Amount",
                                value: "\$ ${myOrderController.order[index]
                                ['orderSpent'].toString()}",
                              ),
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

class NewWidget extends StatelessWidget {
  NewWidget({
    this.title,
    this.value,
    super.key,
  });

  String? title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: const TextStyle().normal16w600,
        ),
        Text(
          value ?? "",
          style: const TextStyle().normal16w400,
        )
      ],
    );
  }
}

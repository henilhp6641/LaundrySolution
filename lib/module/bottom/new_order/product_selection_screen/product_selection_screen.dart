import 'package:ft_washing_app/module/bottom/new_order/product_selection_screen/product_selection_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class ProductSelectionScreen extends StatefulWidget {
  const ProductSelectionScreen({super.key});

  @override
  State<ProductSelectionScreen> createState() => _ProductSelectionScreenState();
}

class _ProductSelectionScreenState extends State<ProductSelectionScreen> {
  final productSelectionController =
      Get.put<ProductSelectionController>(ProductSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        isShowBackButton: false,
        title: ConstString.makeYourOrder,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: AppColor.gray800,
              size: 25,
            ),
          )
        ],
      ),
      body: GetBuilder<ProductSelectionController>(
        builder: (c) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // childAspectRatio: MediaQuery.of(context).size.width /
                  //     (MediaQuery.of(context).size.height / 1.),
                  mainAxisExtent: MediaQuery.of(context).size.height / 3,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 100),
                shrinkWrap: true,
                itemCount: productSelectionController.productList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                        // color: AppColor.greenAccent,
                        ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            productSelectionController.productList[index]
                                ['image'],
                            width: double.infinity,
                            height: 130,
                            // fit: BoxFit.,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                productSelectionController.productList[index]
                                    ['product'],
                                style: const TextStyle().normal20w400,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColor.primaryYellow,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "4.9",
                                  style: const TextStyle()
                                      .normal16w600
                                      .textColor(AppColor.gray400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.primary.withOpacity(0.06)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  child: const Icon(Icons.remove),
                                  // ignore: curly_braces_in_flow_control_structures
                                  onTap: () => productSelectionController
                                      .decrementCount(
                                      index) /*() {
                                    setState(() {
                                      productSelectionController
                                                  .productList[index]['count'] <
                                              1
                                          ? (productSelectionController
                                              .productList[index]['count'] = 0)
                                          : (productSelectionController
                                              .productList[index]['count']--);

                                      // for (int i = 0;
                                      //     i <
                                      //         productSelectionController
                                      //             .productList.length;
                                      //     i++) {
                                      //   // productSelectionController
                                      //   //             .productList[i]['count'] <
                                      //   //         1
                                      //   //     ? (productSelectionController
                                      //   //         .total_count.value = 0)
                                      //   //     :
                                      //   productSelectionController
                                      //               .total_count =
                                      //           productSelectionController
                                      //                   .total_count -
                                      //               productSelectionController
                                      //                       .productList[i]
                                      //                   ['count'];
                                      // }
                                      // print(
                                      //     "HELLO HPOP${productSelectionController.total_count}");
                                    });
                                  },*/
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Text(
                                  c.productList[index]['count'].toString(),
                                  style: const TextStyle()
                                      .normal12w400
                                      .textColor(AppColor.primary),
                                ),
                              ),
                              InkWell(
                                  child: const Icon(Icons.add),
                                  onTap: () => productSelectionController
                                      .incrementCount(
                                      index) /*() {
                                    setState(() {


                                      // for (int i = 0;
                                      //     i <
                                      //         productSelectionController
                                      //             .productList.length;
                                      //     i++) {
                                      //   // productSelectionController
                                      //   //             .productList[i]['count'] <
                                      //   //         0
                                      //   //     ? (productSelectionController
                                      //   //         .total_count.value = 0)
                                      //   //     :
                                      //   productSelectionController
                                      //               .total_count =
                                      //           productSelectionController
                                      //                   .total_count +
                                      //               productSelectionController
                                      //                       .productList[i]
                                      //                   ['count'];
                                      // }
                                      // print(
                                      //     "HELLO HPOP${productSelectionController.total_count}");
                                    });
                                  },*/
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: CommonAppButton(
                  buttonType: ButtonType.enable,
                  text: ConstString.next,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(AppRouter.cartScreen);
                    // registerController.registerUser();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

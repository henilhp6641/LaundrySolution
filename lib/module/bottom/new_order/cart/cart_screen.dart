import 'package:ft_washing_app/module/bottom/new_order/cart/cart_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import '../../profile/laundry_one/laundry_one_controller.dart';
import '../product_selection_screen/product_selection_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController = Get.put<CartController>(CartController());
  final productSelectionController = Get.find<ProductSelectionController>();
  final laundryOneController = Get.put<LaundryOneController>(LaundryOneController());

  @override
  void initState() {
    for (int i = 0; i < productSelectionController.productList.length; i++) {
      cartController.total = cartController.total +
          5 *
              int.parse(productSelectionController.productList[i]["count"]
                  .toString());
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          Get.put<ProductSelectionController>(ProductSelectionController());
          // for(int i=0;i<productSelectionController.productList.length;i++){ productSelectionController.productList[i]['count'].toString();}
        });
        return true;
      },
      child: Scaffold(
          backgroundColor: AppColor.white,
          appBar: CommonAppBar(
            isShowBackButton: true,
            appBar: AppBar(),
            title: ConstString.cart,
          ),
          bottomSheet: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0.5,
                      color: AppColor.gray400.withOpacity(0.2),
                      offset: const Offset(0, -1),
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total:",
                          style: const TextStyle().normal18w500,
                        ),
                        Text(
                          "\$${cartController.total}",
                          style: const TextStyle().normal20w600,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Subscribe Plan Discount:",
                          style: const TextStyle().normal18w500,
                        ),
                        cartController.isChecked
                            ? Text(
                                "-\$${cartController.total}",
                                style: const TextStyle().normal20w600,
                              )
                            : Text(
                                "\$ 0",
                                style: const TextStyle().normal20w600,
                              ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.2,
                      color: AppColor.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total cost:",
                          style: const TextStyle().normal18w500,
                        ),
                        cartController.isChecked
                            ? Text(
                                "\$ 0",
                                style: const TextStyle().normal20w600,
                              )
                            : Text(
                                "\$${cartController.total}",
                                style: const TextStyle().normal20w600,
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // laundryOneController.laundryOne.isEmpty ?  Container():
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  cartController.isChecked =
                                      !cartController.isChecked;
                                });
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: cartController.isChecked
                                    ? Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green),
                                        child: const Icon(
                                          Icons.check,
                                          size: 15.0,
                                          color: Colors.white,
                                        ))
                                    : Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        padding: const EdgeInsets.all(0.0),
                                        child: const Icon(
                                          Icons.circle,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "You Want To Go With Your Current Washing Plan?",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // laundryOneController.laundryOne.isEmpty ?  Expanded(child: Container()):
                    const SizedBox(
                      height: 20,
                    ),
                    // Expanded(child: C),
                    CommonAppButton(
                      buttonType: ButtonType.enable,
                      text: ConstString.proceedCheckOut,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Get.toNamed(AppRouter.addressSelectionScreen);
                        // registerController.registerUser();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          body: GetBuilder<ProductSelectionController>(builder: (c) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 250),
                itemCount: productSelectionController.productList.length,
                itemBuilder: (context, index) {
                  return productSelectionController.productList[index]
                              ['count'] <
                          1
                      ? Container()
                      : Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {
                              // productSelectionController.productList.removeAt(index);
                            });
                          },
                          background: Container(
                            decoration: BoxDecoration(
                              color: AppColor.primaryRed.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: AppColor.primaryRed,
                              size: 30,
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.primary.withOpacity(0.06),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    productSelectionController
                                        .productList[index]['image'],
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$ ${5 * productSelectionController.productList[index]['count']}",
                                            style: const TextStyle()
                                                .normal20wBold
                                                .textColor(AppColor.primary),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: AppColor.primary
                                                    .withOpacity(0.06)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                    child: const Icon(
                                                        Icons.remove),
                                                    // ignore: curly_braces_in_flow_control_structures
                                                    onTap: () {
                                                      setState(() {
                                                        cartController.total =
                                                            cartController.total - 5;
                                                      });

                                                        return productSelectionController
                                                            .decrementCount(
                                                                index); }
                                                  /*() {
                                                setState(() {
                                                  cartController.total =
                                                      cartController.total - 5;

                                                  productSelectionController
                                                                  .productList[
                                                              index]['count'] <
                                                          1
                                                      ? (productSelectionController
                                                              .productList[
                                                          index]['count'] = 0)
                                                      : (productSelectionController
                                                              .productList[
                                                          index]['count']--);

                                                  // productSelectionController.total_count = productSelectionController.total_count - productSelectionController.productList[index]['count'];
                                                });

                                                // for(int i = 0; i < productSelectionController.productList.length;i++)
                                                //   {
                                                //     // total = 0;
                                                //     total = total + 5 * int.parse(productSelectionController.productList[i]['count'].toString());
                                                //   }
                                              },*/
                                                    ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: Text(
                                                      c
                                                          .productList[index]
                                                              ['count']
                                                          .toString(),
                                                      style: const TextStyle()
                                                          .normal12w400
                                                          .textColor(
                                                              AppColor.primary),
                                                    ),

                                                ),
                                                InkWell(
                                                    child:
                                                        const Icon(Icons.add),
                                                    onTap: () {
                                                      setState(() {
                                                        cartController.total =
                                                            cartController.total + 5;
                                                      });

                                                        return productSelectionController
                                                            .incrementCount(
                                                                index) ;}

                                                  /*() {
                                                setState(() {
                                                  cartController.total =
                                                      cartController.total + 5;
                                                  // print(int.parse(productSelectionController.productList[0]['count'].toString()));
                                                  // for(int i = 0; i < productSelectionController.productList.length;i++)
                                                  // {
                                                  //   // total = 0;
                                                  //   total = total + 5 * int.parse(productSelectionController.productList[i]['count'].toString());
                                                  // }
                                                  productSelectionController
                                                                  .productList[
                                                              index]['count'] <
                                                          0
                                                      ? (productSelectionController
                                                              .productList[
                                                          index]['count'] = 0)
                                                      : (productSelectionController
                                                              .productList[
                                                          index]['count']++);

                                                  // productSelectionController.total_count = productSelectionController.total_count + productSelectionController.productList[index]['count'];
                                                });
                                              },*/
                                                    ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
            );
          })),
    );
  }
}

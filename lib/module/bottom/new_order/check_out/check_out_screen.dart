import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ft_washing_app/module/bottom/new_order/product_selection_screen/product_selection_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:http/http.dart' as http;
import '../../profile/address/all_address_controller.dart';
import '../cart/cart_controller.dart';


class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  Map<String, dynamic>? paymentIntent;
  final cartController = Get.find<CartController>();
  final productSelectionController = Get.find<ProductSelectionController>();




  final allAddressController =
  Get.put<AllAddressController>(AllAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        isShowBackButton: true,
        appBar: AppBar(),
        title: ConstString.checkOut,
      ),
      body: StatefulBuilder(
        builder: (BuildContext context,
            void Function(void Function()) setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.primary.withOpacity(0.06)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total cost:",
                        style: const TextStyle().normal18w500,
                      ),
                      cartController.isChecked ? Text("\$ 0",style: const TextStyle().normal20w600,) : Text(
                        "\$ ${cartController.total}",
                        style: const TextStyle().normal20w600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Shipping Address",
                  style: const TextStyle().normal20w600,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
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
                      child:  Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    allAddressController
                                        .addresses[allAddressController.selectedIndex!.value]
                                    ['address1'],
                                    style: const TextStyle()
                                        .normal18w600,
                                  ),
                                  Container(
                                    margin:
                                    const EdgeInsets.only(
                                        left: 10),
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 10,
                                        vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          12),
                                      color: AppColor.primary,
                                    ),
                                    child: Text(
                                      "Home",
                                      style: const TextStyle()
                                          .normal14w500
                                          .textColor(
                                          AppColor.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            allAddressController
                                .addresses[allAddressController.selectedIndex!.value]['address2'],
                            style:
                            const TextStyle().normal16w400,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${allAddressController.addresses[allAddressController.selectedIndex!.value]['city']}, ${allAddressController.addresses[allAddressController.selectedIndex!.value]['country']}, ${allAddressController.addresses[allAddressController.selectedIndex!.value]['postalCode']}",
                            style:
                            const TextStyle().normal16w400,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Payment",
                  style: const TextStyle().normal20w600,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.account_balance_wallet_outlined,
                                color: AppColor.gray800,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Credit / Debit Card",
                                    style: const TextStyle().normal18w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {

                                  // Get.toNamed(AppRouter.editAddressScreen);
                                },
                                child: const Icon(Icons.arrow_forward_ios,
                                    size: 22, color: AppColor.gray800),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CommonAppButton(
                  buttonType: ButtonType.enable,
                  text: ConstString.confirmPayment,
                  onTap: () async{
                    FocusScope.of(context).unfocus();
                     await makePayment();

                    Get.toNamed(AppRouter.checkOutScreen);
                    // registerController.registerUser();
                  },
                ),
              ],
            ),
          );
        }
      ),
    );
  }
  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('100', 'USD');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent![
              'client_secret'], //Gotten from payment intent
              style: ThemeMode.dark,
              merchantDisplayName: 'Ikay'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        Timer timer = Timer(const Duration(milliseconds: 2000), (){
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const BottomBarScreen(),
            ),
                (route) => false,//if you want to disable back feature set to false
          );
          showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100.0,
                    ),
                    SizedBox(height: 10.0),
                    Text("Payment Successful! & Your Order is Successfully Placed!"),
                  ],
                ),
              ));
        });


        cartController.addOrder();
        setState(() {
          cartController.orderCount.value++;
        });
        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed & Your Order is Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout =  cartController.isChecked ? 0 : cartController.total * 100;
    return calculatedAmout.toString();
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ft_washing_app/module/bottom/home/bag/our_plan_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:http/http.dart' as http;

class OurPlanCheckOutScreen extends StatefulWidget {
  const OurPlanCheckOutScreen({super.key, required this.index});
  final int index;

  @override
  State<OurPlanCheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<OurPlanCheckOutScreen> {

  Map<String, dynamic>? paymentIntent;
  final ourPlanController = Get.put<OurPlanController>(OurPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        isShowBackButton: true,
        appBar: AppBar(),
        title: ConstString.checkOut,
      ),
      body: Padding(
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
                   Text(
                    "\$ ${ourPlanController.list[widget.index]['price']}",
                    style: const TextStyle().normal20w600,
                  ),
                ],
              ),
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
              height: 30,
            ),
            CommonAppButton(
              buttonType: ButtonType.enable,
              text: ConstString.confirmPayment,
              onTap: () async{
                FocusScope.of(context).unfocus();
                await makePayment(widget.index);
                // Get.toNamed(AppRouter.checkOutScreen);
                // registerController.registerUser();
              },
            )
          ],
        ),
      ),
    );
  }
  Future<void> makePayment(index) async {
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
      displayPaymentSheet(index);
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet(index) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        Timer timer = Timer(const Duration(milliseconds: 2000), () {
          // Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const BottomBarScreen(),
            ),
                (route) => false, //if you want to disable back feature set to false
          );
        });
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
                  Text("Payment Successful & Your Plan is Successfully Subscribed!",textAlign: TextAlign.center),
                ],
              ),
            ));

        ourPlanController.addPlan(index);
        ourPlanController.list[index]['status'] ="Active";
        // cartController.list[widget.index]['status'] = "Active";
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
                Text("Payment Failed"),
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
    final calculatedAmout =  ourPlanController.list[widget.index]['price'] * 100;
    return calculatedAmout.toString();
  }
}

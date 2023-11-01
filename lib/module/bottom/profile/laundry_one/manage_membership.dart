import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../components/buttons.dart';
import '../../../../components/common_appbar.dart';
import '../../../../package/config_packages.dart';
import '../../../../res/color_schema.dart';
import '../../../../utils/const_string.dart';
import '../../../../utils/enum.dart';
import '../../bottom_bar_screen.dart';
import 'package:http/http.dart' as http;

import 'laundry_one_controller.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  Map<String, dynamic>? paymentIntent;
  final laundryOneController =
      Get.put<LaundryOneController>(LaundryOneController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: CommonAppBar(
            appBar: AppBar(),
            centerTitle: true,
            title: ConstString.manageMembership,
          ),
          backgroundColor: AppColor.white,
          body: laundryOneController.showProgress.value
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    ListTile(
                        title: const Text('Your membership'),
                        subtitle: const Text('Laundry One'),
                        trailing: Text(laundryOneController
                                .laundryOne.isNotEmpty
                            ? 'Renews on ${laundryOneController.laundryOne['laundryOneDate']}'
                            : "")),
                    const Divider(),
                    ListTile(
                        title: const Text('Current Membership'),
                        subtitle: const Text('Monthly Plan - \$25.00'),
                        trailing: Text(
                          laundryOneController.laundryOne.isNotEmpty
                              ? "${laundryOneController.laundryOne['laundryOneStatus']}"
                              : "Inactive",
                          style: TextStyle(
                              color: laundryOneController.laundryOne.isNotEmpty
                                  ? AppColor.primaryGreen
                                  : AppColor.primaryRed),
                        )),
                    const Divider(),
                    laundryOneController.laundryOne['laundryOneStatus'] ==
                            'Active'
                        ? Container()
                        : ListTile(
                            title: const Text('Renew membership'),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: CommonAppButton(
                                buttonType: ButtonType.enable,
                                text: 'Make Payment',
                                width: 600,
                                color: AppColor.primary,
                                onTap: () async {
                                  // FocusScope.of(context).unfocus();
                                  await makePayment();
                                },
                              ),
                            ),
                          ),
                  ],
                )),
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
                      Text("Payment Successful!",textAlign: TextAlign.center),
                    ],
                  ),
                ));

        laundryOneController.addLaundryOne();

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
    int calculatedAmount = laundryOneController.laundryOnePrice * 100;
    return calculatedAmount.toString();
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ft_washing_app/module/bottom/new_order/product_selection_screen/product_selection_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:http/http.dart' as http;
import '../../bottom_bar_controller.dart';
import '../../profile/address/all_address_controller.dart';
import '../../profile/laundry_one/laundry_one_controller.dart';
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
  final laundryOneController =
      Get.put<LaundryOneController>(LaundryOneController());

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final bottomBarController =
      Get.put<BottomBarController>(BottomBarController());

  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    cartController.flutterLocalNotificationsPlugin
        .initialize(initializationSettings);

    _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      setState(() {
        cartController.fcmToken = token;
      });
      print("FCM Token: $token");
    });

    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _handleMessage(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      print(
          "Received a message while in foreground: ${message!.notification?.body}");
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        // cartController.showNotification(
        //     message.notification!.title ?? '', message.notification!.body ?? '');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message);
    });
  }

  void _handleMessage(RemoteMessage? message) {
    if (message != null) {
      print("Notification clicked: ${message.notification?.body}");
      // Handle the actual notification received from Firebase
    } else {
      print("Simulated notification tap from InkWell");
      // Handle the simulated notification tap (e.g., display a dialog, navigate, etc.)
    }
  }

  // void selectNotification(NotificationResponse response) async {
  //   String? payload = response.payload;
  //   if (payload != null) {
  //     debugPrint('notification payload: $payload');
  //   }
  //
  //     bottomBarController.selectedIndex.value=2;
  //
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderScreen()));
  //
  //   print("Context: $context");
  //   print("Response: $response");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        isShowBackButton: true,
        appBar: AppBar(),
        title: ConstString.checkOut,
      ),
      body: StatefulBuilder(builder:
          (BuildContext context, void Function(void Function()) setState) {
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
                    cartController.isChecked
                        ? Text(
                            "\$ 0",
                            style: const TextStyle().normal20w600,
                          )
                        : cartController.isCheckedLaundryOne
                            ? Text(
                                "\$ ${(cartController.total * 0.9)}",
                                style: const TextStyle().normal20w600,
                              )
                            : Text(
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
              allAddressController.addresses.isEmpty
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text('No Addresses Found'),
                    ))
                  : ListView.builder(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        allAddressController.addresses[
                                            allAddressController.selectedIndex!
                                                .value]['address1'],
                                        style: const TextStyle().normal18w600,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppColor.primary,
                                        ),
                                        child: Text(
                                          "Home",
                                          style: const TextStyle()
                                              .normal14w500
                                              .textColor(AppColor.white),
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
                                allAddressController.addresses[
                                    allAddressController
                                        .selectedIndex!.value]['address2'],
                                style: const TextStyle().normal16w400,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${allAddressController.addresses[allAddressController.selectedIndex!.value]['city']}, ${allAddressController.addresses[allAddressController.selectedIndex!.value]['country']}, ${allAddressController.addresses[allAddressController.selectedIndex!.value]['postalCode']}",
                                style: const TextStyle().normal16w400,
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
                height: 20,
              ),
              cartController.isChecked
                  ? Container()
                  : laundryOneController.laundryOne['laundryOneStatus'] ==
                          'Active'
                      ? Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    cartController.isCheckedLaundryOne =
                                        !cartController.isCheckedLaundryOne;

                                    if (cartController.isCheckedLaundryOne) {
                                      showDialog(
                                          context: context,
                                          builder: (_) =>  AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green,
                                                  size: 100.0,
                                                ),
                                                const SizedBox(height: 10.0),
                                                const Text("Congratulation! You also get clothes insurance in LaundryOne subscription!",textAlign: TextAlign.center,),
                                                const SizedBox(height: 10.0),
                                                InkWell(
                                                    onTap: (){ Get.toNamed(AppRouter.insuranceTermsScreen);},
                                                    child: const Text("Click here for information!",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primary, decoration: TextDecoration.underline,),)),
                                              ],
                                            ),
                                          ));
                                      // Close the dialog after 3 seconds
                                      Future.delayed(const Duration(seconds: 5), () {
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: cartController.isCheckedLaundryOne
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
                                            size: 25.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "You Want To Go With Your Laundry One Discount?",
                              style: TextStyle(fontSize: 13.0),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        )
                      : Container(),
              cartController.isChecked
                  ? Container()
                  : laundryOneController.laundryOne['laundryOneStatus'] ==
                          'Active'
                      ? const SizedBox(
                          height: 20,
                        )
                      : Container(),
              CommonAppButton(
                buttonType: ButtonType.enable,
                text: cartController.isChecked
                    ? ConstString.confirmOrder
                    : ConstString.confirmPayment,
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  // const LoadingScreen();
                  allAddressController.addresses.isEmpty
                      ? openDialog()
                      : cartController.isChecked
                          ? confirmOrder()
                          : await makePayment();

                  // Get.toNamed(AppRouter.checkOutScreen);
                  // registerController.registerUser();
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  void openDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(ConstString.addAddressMessage),
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
                  Get.back();
                  Get.back();
                },
                child: const Text(ConstString.yes),
              ),
            ],
          );
        });
  }

  void confirmOrder() {
    cartController.total.value = 0;

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
                  Text("Your Order is Successfully Submitted!",textAlign: TextAlign.center,),
                ],
              ),
            ));

    cartController.addOrder();
    cartController.showNotification();
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
                  merchantDisplayName: 'Okay'))
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
                      Text(
                          "Payment Successful & Your Order is Successfully Submitted!",textAlign: TextAlign.center),
                    ],
                  ),
                ));
        cartController.addOrder();
        cartController.showNotification();

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
    final calculatedAmount = cartController.isChecked
        ? 0
        : cartController.isCheckedLaundryOne
            ? (cartController.total * 0.9 * 100).toInt()
            : cartController.total * 100;

    //     cartController.isChecked ? 0 : cartController.isCheckedLaundryOne
    //       ? 10
    // // ? (cartController.total.value * 0.9).toInt().toString() * 100
    //         : cartController.total * 100;
    return calculatedAmount.toString();
  }
}

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:intl/intl.dart';
import '../../../../utils/const_string.dart';
import '../../../../utils/firebase_string.dart';
import '../../../../widgets/app_loader.dart';
import '../../../../widgets/error_sheet.dart';
import '../../my_order/my_order_controller.dart';
import '../product_selection_screen/product_selection_controller.dart';

class CartController extends GetxController {
  final random = Random();
  RxInt total = 0.obs;
  final myOrderController = Get.put<MyOrderController>(MyOrderController());
  final productSelectionController =
      Get.put<ProductSelectionController>(ProductSelectionController());

  bool isChecked = false;
  bool isCheckedLaundryOne = false;

  String? fcmToken;

  TextEditingController orderDateController = TextEditingController();
  RxString orderDateString = "".obs;

  TextEditingController orderNumberController = TextEditingController();
  RxString orderNumberString = "".obs;

  TextEditingController orderSpentController = TextEditingController();
  RxString orderSpentString = "".obs;

  TextEditingController orderStatusController = TextEditingController();
  RxString orderStatusString = "".obs;

  Future<void> addOrder() async {
    showLoader();
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    String userId = AppPref().uid;
    DocumentReference userRef =
        fireStore.collection(FirebaseString.users).doc(userId);
    Map<String, dynamic> newAddress = {
      'orderDate': DateFormat('yyyy-MM-dd')
          .format(DateTime.now()), //orderDateController.text,
      'orderPickUpDate': DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(const Duration(days: 2))),
      'orderNumber':
          Random().nextInt(900000000).toString(), //orderNumberController.text,
      'orderSpent': total.value, //orderSpentController.text,
      'orderStatus': 'Pending' //orderStatusController.text,
    };

    try {
      // orderCount.value++;
      await userRef.update({
        'orders': FieldValue.arrayUnion([newAddress]),
      });
      Get.back();
      myOrderController.fetchOrder();
      total.value = 0;
      for (int i = 0; i < productSelectionController.productList.length; i++) {
        productSelectionController.productList[i]['count'] = 0;
      }

      // controller.addAddress(newAddress);

      dismissLoader();
    } catch (e) {
      dismissLoader();
      ErrorSheet.showErrorSheet("${ConstString.errorAddingOrder} $e");
    }
  }

  // Future<void> sendNotification() async {
  //   final postUrl = 'https://fcm.googleapis.com/fcm/send';
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization':
  //         'key=AAAAllc2FtQ:APA91bFdBHKpDv3SbTbMcJVp5S2yP_7C9BKeSz_H8HVxAI3LH5KJLzcW4cE0zdDUqjeRFsFbW_H13_pF7lt115t3KEbdW8SJZLkUe7--ALy86tx4I0oSr7ABN9F6Cwg0UZOPfir6EdPp', // Replace with your server key from Firebase Console
  //   };
  //
  //   final String orderNumber = Random().nextInt(900000000).toString();
  //   final int orderSpent = total.value;
  //   final String orderPickUpDate = DateFormat('yyyy-MM-dd')
  //       .format(DateTime.now().add(const Duration(days: 2)));
  //
  //   final response = await http.post(
  //     Uri.parse(postUrl),
  //     headers: headers,
  //     body: json.encode({
  //       'notification': {
  //         'title': 'Order Confirmation',
  //         'body':
  //             'Your order has been successfully placed. Order Number: $orderNumber, Order Spent: $orderSpent, Pickup Date: $orderPickUpDate',
  //         'sound': 'default',
  //       },
  //       'priority': 'high',
  //       'data': {
  //         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //         'id': '1',
  //         'status': 'done',
  //       },
  //       'to': fcmToken,
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print("Notification sent successfully");
  //   } else {
  //     print("Notification failed to send: ${response.body}");
  //   }
  // }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> showNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'channel_ID', 'channel_name',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    // var iOSPlatformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    try {
      await flutterLocalNotificationsPlugin.show(0, 'Order Confirmation',
          'Your Order has been Successfully Placed!', platformChannelSpecifics, payload: 'item_x',  // You can use this payload in the selectNotification callback if needed.
      );
    } catch (e) {
      print('Error showing notification: $e');
    }
  }





}

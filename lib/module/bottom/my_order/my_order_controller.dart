import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/package/config_packages.dart';

import '../../../utils/firebase_string.dart';

class MyOrderController extends GetxController{

  RxList<Map<String, dynamic>> order = <Map<String, dynamic>>[].obs;

  Future<List<Map<String, dynamic>>?> getOrders() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId = AppPref().uid;
    DocumentReference userRef =
    firestore.collection(FirebaseString.users).doc(userId);

    try {
      DocumentSnapshot userDocument = await userRef.get();

      if (userDocument.exists) {
        Map<String, dynamic> userData =
        userDocument.data() as Map<String, dynamic>;

        // Check if the 'orders' field exists in the user's data
        if (userData.containsKey('orders')) {
          List<Map<String, dynamic>> orders =
          List<Map<String, dynamic>>.from(userData['orders']);
          return orders;
        } else {
          print("User has no order.");
          return null;
        }
      } else {
        print("User does not exist.");
        return null;
      }
    } catch (e) {
      print("Error fetching orders: $e");
      return null;
    }
  }

  Future<void> fetchOrder() async {
    List<Map<String, dynamic>>? fetchedOrders = await getOrders();
    if (fetchedOrders != null) {
      order.value = fetchedOrders;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchOrder();

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchOrder();
  }
}
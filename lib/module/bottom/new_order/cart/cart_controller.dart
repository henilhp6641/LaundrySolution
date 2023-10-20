import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:intl/intl.dart';

import '../../../../utils/const_string.dart';
import '../../../../utils/firebase_string.dart';
import '../../../../widgets/app_loader.dart';
import '../../../../widgets/error_sheet.dart';

class CartController extends GetxController{
  RxInt total = 0.obs;
  RxInt orderCount = 1.obs;

  bool isChecked = false;

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
    DocumentReference userRef = fireStore.collection(FirebaseString.users).doc(userId);
    Map<String, dynamic> newAddress = {
      'orderDate': DateFormat('yyyy-MM-dd').format(DateTime.now()),//orderDateController.text,
      'orderPickUpDate': DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 2))),
      'orderNumber': orderCount.value,//orderNumberController.text,
      'orderSpent': total.value,//orderSpentController.text,
      'orderStatus': 'Pending'//orderStatusController.text,
    };

    try {
      orderCount.value++;
      await userRef.update(
          {
        'orders': FieldValue.arrayUnion([newAddress]),
      });

      // controller.addAddress(newAddress);

      dismissLoader();

    } catch (e) {
      dismissLoader();
      ErrorSheet.showErrorSheet("${ConstString.errorAddingOrder} $e");
    }
  }

}
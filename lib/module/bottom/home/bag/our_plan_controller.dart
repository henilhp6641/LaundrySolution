import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/firebase_string.dart';
import 'package:ft_washing_app/widgets/error_sheet.dart';

import '../../../../widgets/app_loader.dart';

class OurPlanController extends GetxController{


  RxList list = [
    {
      'weight':"1 KG",
      'title':"1KG MONTHLY PLAN // 1 1kg bag per week, includes washing and folding.",
      "price": 75,
      "status":"Active"
    },
    {
      'weight':"5 KG",
      'title':"5KG MONTHLY PLAN // 1 5kg bag per week, includes washing and folding.",
      "price":250,
      "status":"Inactive"
    },
    {
      'weight':"10 KG",
      'title':"10KG MONTHLY PLAN // 2 5kg bag per week, includes washing and folding.",
      "price":400,
      "status":"Inactive"
    }
  ].obs;



  Future<void> addPlan(index) async {
    showLoader();
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    String userId = AppPref().uid;
    DocumentReference userRef = fireStore.collection(FirebaseString.users).doc(userId);

    Map<String, dynamic> plan = {
      'planWeight': list[index]['weight'],
      'planTitle': list[index]['title'],
      'planPrice': list[index]['price'],
      'planStatus': "Active"//list[index]['status'],
    };
    try {
      await userRef.update({
        'plan': plan,
      });

      dismissLoader();

      Get.back();
      // list[index]['status'] ="Active";

    } catch (e) {
      dismissLoader();
      ErrorSheet.showErrorSheet("${ConstString.errorAddingAddress} $e");
    }
  }


}
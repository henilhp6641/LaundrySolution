import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/package/config_packages.dart';

import '../../../../utils/firebase_string.dart';

class MyPlanController extends GetxController{
 bool isActive=false;

 RxMap<String, dynamic> plan = <String, dynamic>{}.obs;

 Future<Map<String, dynamic>?> getPlan() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userId = AppPref().uid;
  DocumentReference userRef =
  firestore.collection(FirebaseString.users).doc(userId);

  try {
   DocumentSnapshot userDocument = await userRef.get();

   if (userDocument.exists) {
    Map<String, dynamic> userData =
    userDocument.data() as Map<String, dynamic>;

    // Check if the 'order' field exists in the user's data
    if (userData.containsKey('plan')) {
     Map<String, dynamic> planData = userData['plan'];
     return planData;
    } else {
     print("User has no plan.");
     return null;
    }
   } else {
    print("User does not exist.");
    return null;
   }
  } catch (e) {
   print("Error fetching plan: $e");
   return null;
  }
 }

 Future<void> fetchPlan() async {
  Map<String, dynamic>? fetchedPlan = await getPlan();
  if (fetchedPlan != null) {
   plan.value = fetchedPlan;
  }
 }


 @override
 void onInit() {
  fetchPlan();
  super.onInit();
 }

 @override
 void onReady() {
  super.onReady();
  fetchPlan();
 }

}
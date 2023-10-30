import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/firebase_string.dart';
import 'package:ft_washing_app/widgets/error_sheet.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/app_loader.dart';

class LaundryOneController extends GetxController{

  RxBool showProgress = false.obs;
  int laundryOnePrice=25;

  Future<void> addLaundryOne() async {

    showLoader();
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    String userId = AppPref().uid;
    DocumentReference userRef = fireStore.collection(FirebaseString.users).doc(userId);


    Map<String, dynamic> laundryOne = {
      'laundryOneDate': DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year, DateTime.now().month + 1, 0)),
      'laundryOneStatus': "Active",
    };
    try {
      await userRef.update({
        'laundryOne': laundryOne,
      });
      dismissLoader();
      // Get.back();

    } catch (e) {
      dismissLoader();
      ErrorSheet.showErrorSheet("${ConstString.errorAddingLaundryOne} $e");
    }
  }

  RxMap<String, dynamic> laundryOne = <String, dynamic>{}.obs;

  Future<Map<String, dynamic>?> getPlan() async {
    showProgress.value = true;
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
        if (userData.containsKey('laundryOne')) {
          Map<String, dynamic> planData = userData['laundryOne'];
          return planData;
        } else {
          showProgress.value = false;
          print("User has no Laundry One.");
          return null;
        }
      } else {
        showProgress.value = false;
        print("User does not exist.");
        return null;
      }
    } catch (e) {
      showProgress.value = false;
      print("Error fetching Laundry One: $e");
      return null;
    }
  }

  Future<void> fetchPlan() async {
    Map<String, dynamic>? fetchedPlan = await getPlan();
    if (fetchedPlan != null) {
      laundryOne.value = fetchedPlan;
      showProgress.value = false;
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
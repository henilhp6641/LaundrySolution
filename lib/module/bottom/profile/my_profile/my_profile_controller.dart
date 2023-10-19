import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/firebase_string.dart';

class MyProfileController extends GetxController {
  RxList<Map<String, dynamic>> profile = <Map<String, dynamic>>[].obs;


  Future<Map<String, dynamic>?> getUserData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId = AppPref().uid;
    DocumentReference userRef =
    firestore.collection(FirebaseString.users).doc(userId);

    try {
      DocumentSnapshot userDocument = await userRef.get();

      if (userDocument.exists) {
        return userDocument.data() as Map<String, dynamic>;
      } else {
        print("User does not exist.");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }

  Future<void> fetchUserData() async {
    Map<String, dynamic>? userData = await getUserData();
    if (userData != null) {

      // Save the user data to the profile RxList
      profile.clear(); // Clear any existing data
      profile.add(userData);
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    fetchUserData();

    super.onInit();
  }
}

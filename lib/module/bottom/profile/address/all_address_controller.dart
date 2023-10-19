import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/firebase_string.dart';

class AllAddressController extends GetxController {
  RxList<Map<String, dynamic>> addresses = <Map<String, dynamic>>[].obs;
  RxInt? selectedIndex = (0).obs;  // -1 indicates no selection

  void addAddress(Map<String, dynamic> map){
    addresses.add(map);
    update();
  }

  Future<void> deleteAddress(int index) async {
  if (index >= 0 && index < addresses.length) {
    Map<String, dynamic> addressToDelete = addresses[index];
    await deleteAddressInFirestore(addressToDelete);
    addresses.removeAt(index);
  }
}

Future<void> deleteAddressInFirestore(Map<String, dynamic> address) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userId = AppPref().uid;
  DocumentReference userRef =
      firestore.collection(FirebaseString.users).doc(userId);

  await userRef.update({
    'addresses': FieldValue.arrayRemove([address]),
  });
}

  Future<List<Map<String, dynamic>>?> getAddresses() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId = AppPref().uid;
    DocumentReference userRef =
        firestore.collection(FirebaseString.users).doc(userId);

    try {
      DocumentSnapshot userDocument = await userRef.get();

      if (userDocument.exists) {
        Map<String, dynamic> userData =
            userDocument.data() as Map<String, dynamic>;

        // Check if the 'addresses' field exists in the user's data
        if (userData.containsKey('addresses')) {
          List<Map<String, dynamic>> addresses =
              List<Map<String, dynamic>>.from(userData['addresses']);
          return addresses;
        } else {
          print("User has no addresses.");
          return null;
        }
      } else {
        print("User does not exist.");
        return null;
      }
    } catch (e) {
      print("Error fetching addresses: $e");
      return null;
    }
  }

  Future<void> fetchAddresses() async {
    List<Map<String, dynamic>>? fetchedAddresses = await getAddresses();
    if (fetchedAddresses != null) {
      addresses.value = fetchedAddresses;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAddresses();

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchAddresses();
  }
}

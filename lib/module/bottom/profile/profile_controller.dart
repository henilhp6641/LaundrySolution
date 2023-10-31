import 'package:firebase_auth/firebase_auth.dart';
import 'package:ft_washing_app/data/model/user_model.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';

class ProfileController extends GetxController {
  final userData = Rxn<UserData>();
  final databaseReference = FirebaseDatabase.instance.reference();
  Position? currentPosition;

  void fetchData() async {
    try {
      DatabaseEvent event = await databaseReference.child('0').once();
      DataSnapshot snapshot = event.snapshot;
       print('Data : ${snapshot.value}');
    } catch(e) {
      print('Error : ${e.toString()}');
    }
  }


  // Future<void> fetchData() async {
  //   databaseReference.child('slider').once().then((DataSnapshot snapshot) {
  //     print('HP Data : ${snapshot.value}');
  //   } as FutureOr Function(DatabaseEvent value));
  //
  //
  //
  //   try {
  //     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //         .collection(FirebaseString.users)
  //         .doc(AppPref().uid)
  //         .get();
  //
  //     if (documentSnapshot.exists) {
  //       userData.value =
  //           UserData.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  //     } else {
  //       if (kDebugMode) {
  //         print("Document not found");
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Error fetching document: $e");
  //     }
  //   }
  // }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }
}

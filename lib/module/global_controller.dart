// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:ft_washing_app/data/model/user_model.dart';
//
// class GlobalController extends GetxController {
//   Rx<UserModel> userModel = UserModel().obs;
//   final FirebaseAuth authUser = FirebaseAuth.instance;
//
//   getUser() async {
//     final User? user = authUser.currentUser;
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user?.uid)
//         .get()
//         .then((value) {
//       userModel.value = UserModel.fromJson(value.data()!);
//     });
//   }
//
//   @override
//   void onInit() {
//     if (authUser.currentUser != null) {
//       getUser();
//     }
//     // TODO: implement onInit
//     super.onInit();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ft_washing_app/module/bottom/profile/address/all_address_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/firebase_string.dart';
import 'package:ft_washing_app/widgets/app_loader.dart';
import 'package:ft_washing_app/widgets/error_sheet.dart';


class AddAddressController extends GetxController {
  TextEditingController address1Controller = TextEditingController();
  RxString address1String = "".obs;
  TextEditingController address2Controller = TextEditingController();
  RxString address2String = "".obs;
  TextEditingController cityController = TextEditingController();
  RxString cityString = "".obs;
  TextEditingController postalCodeController = TextEditingController();
  RxString postalCodeString = "".obs;
  TextEditingController countryController = TextEditingController();
  RxString countryString = "".obs;

  RxBool setDefault = true.obs;
  final controller = Get.find<AllAddressController>();



  Future<void> addAddress() async {
    showLoader();
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    String userId = AppPref().uid;
    DocumentReference userRef = fireStore.collection(FirebaseString.users).doc(userId);
    Map<String, dynamic> newAddress = {
      'address1': address1Controller.text,
      'address2': address2Controller.text,
      'city': cityController.text,
      'postalCode': postalCodeController.text,
      'country': countryController.text,
      'setDefault': setDefault.value
    };

    try {
      await userRef.update({
        'addresses': FieldValue.arrayUnion([newAddress]),
      });

      controller.addAddress(newAddress);

      dismissLoader();

      Get.back();
      // Navigator.pushAndRemoveUntil(
      //     context as BuildContext,
      //     MaterialPageRoute(
      //         builder: (context) => AllAddressScreen()
      //     ),
      //       (route) => false,
      // );

    } catch (e) {
      dismissLoader();
      ErrorSheet.showErrorSheet("${ConstString.errorAddingAddress} $e");
    }
  }
}

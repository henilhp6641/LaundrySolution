import 'package:ft_washing_app/module/bottom/home/bag/our_plan.dart';
import 'package:ft_washing_app/module/bottom/home/how_works/how_works_screen.dart';
import 'package:ft_washing_app/module/bottom/my_order/my_order_screen.dart';
import 'package:ft_washing_app/module/bottom/new_order/address_selection/address_selection_screen.dart';
import 'package:ft_washing_app/module/bottom/new_order/cart/cart_screen.dart';
import 'package:ft_washing_app/module/bottom/new_order/check_out/check_out_screen.dart';
import 'package:ft_washing_app/module/bottom/new_order/product_selection_screen/product_selection_screen.dart';
import 'package:ft_washing_app/module/bottom/profile/Map/laundry_location_screen.dart';
import 'package:ft_washing_app/module/bottom/profile/change_password/change_password_screen.dart';
import 'package:ft_washing_app/module/bottom/profile/edit/edit_profile_screen.dart';
import 'package:ft_washing_app/module/bottom/profile/laundry_one/manage_membership.dart';
import 'package:ft_washing_app/module/bottom/profile/my_plans/my_plans_screen.dart';
import 'package:ft_washing_app/module/bottom/profile/my_profile/my_profile_screen.dart';

import 'module/bottom/profile/address/all_address_screen.dart';
import 'module/bottom/profile/address/edit/add_address_screen.dart';
import 'module/bottom/profile/laundry_one/insurance_term_screen.dart';
import 'module/bottom/profile/laundry_one/laundry_one.dart';
import 'package/config_packages.dart';

class AppRouter {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const emailVerification = '/emailVerification';
  static const bottomBar = '/bottomBar';
  static const monthlyBag = '/monthlyBag';
  static const editProfile = '/editProfile';
  static const laundryLocation = '/laundryLocation';
  static const changePassword = '/changePassword';
  static const myPlan = '/myPlan';
  static const allAddress = '/allAddress';
  static const editAddressScreen = '/editAddressScreen';
  static const howWorks = '/howWorks';
  static const myOrderScreen = '/myOrderScreen';
  static const productSelectionScreen = '/productSelectionScreen';
  static const cartScreen = '/cartScreen';
  static const checkOutScreen = '/checkOutScreen';
  static const ourPlanCheckOutScreen = '/ourPlanCheckOutScreen';
  static const addressSelectionScreen = '/addressSelectionScreen';
  static const myProfileScreen = '/myProfileScreen';
  static const laundryOneScreen = '/laundryOneScreen';
  static const membershipScreen = '/membershipScreen';
  static const insuranceTermsScreen = '/insuranceTermsScreen';

  static List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(
        name: emailVerification, page: () => const EmailVerificationScreen()),
    GetPage(
        name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: bottomBar, page: () => const BottomBarScreen()),
    GetPage(name: monthlyBag, page: () => const OurPlanScreen()),
    GetPage(name: editProfile, page: () => const EditProfileScreen()),
    GetPage(name: laundryOneScreen, page: () => LaundryOneScreen()),
    GetPage(name: membershipScreen, page: () => const MembershipScreen()),
    GetPage(name: insuranceTermsScreen, page: () =>  InsuranceTermsScreen()),
    GetPage(name: changePassword, page: () => const ChangePasswordScreen()),
    GetPage(name: myPlan, page: () => const MyPlansScreen()),
    GetPage(name: allAddress, page: () => const AllAddressScreen()),
    GetPage(name: editAddressScreen, page: () => const AddAddressScreen()),
    GetPage(name: howWorks, page: () => const HowWorksScreen()),
    GetPage(name: myOrderScreen, page: () => const MyOrderScreen()),
    GetPage(name: productSelectionScreen, page: () => const ProductSelectionScreen()),
    GetPage(name: cartScreen, page: () => const CartScreen()),
    GetPage(name: checkOutScreen, page: () => const CheckOutScreen()),
    // GetPage(name: ourPlanCheckOutScreen, page: () =>  OurPlanCheckOutScreen(index: null,)),
    GetPage(name: addressSelectionScreen, page: () => const AddressSelectionScreen()),
    GetPage(name: myProfileScreen, page: () =>  const MyProfileScreen()),
    GetPage(name: laundryLocation, page: () =>  const LaundryLocation()),
  ];
}

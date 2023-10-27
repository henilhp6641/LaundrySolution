import 'package:ft_washing_app/module/bottom/bottom_bar_controller.dart';
import 'package:ft_washing_app/module/bottom/home/home_screen.dart';
import 'package:ft_washing_app/module/bottom/my_order/my_order_screen.dart';
import 'package:ft_washing_app/module/bottom/new_order/product_selection_screen/product_selection_screen.dart';
import 'package:ft_washing_app/module/bottom/profile/profile_screen.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final bottomBarController =
      Get.put<BottomBarController>(BottomBarController());

  void onItemTapped(int index) {
    bottomBarController.selectedIndex.value = index;
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const ProductSelectionScreen(),
    const MyOrderScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => IndexedStack(

          index: bottomBarController.selectedIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColor.white,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: AppColor.greyDark,
          unselectedLabelStyle: const TextStyle().normal12w400,
          selectedLabelStyle: const TextStyle().normal12w400,
          elevation: 1,

          currentIndex: bottomBarController.selectedIndex.value,
          //New
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppColor.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: AppColor.primary,
              ),
              label: ConstString.start,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(
                Icons.shopping_bag,
                color: AppColor.primary,
              ),
              label: ConstString.newOrders,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dns_outlined),
              activeIcon: Icon(
                Icons.dns,
                color: AppColor.primary,
              ),
              label: ConstString.myOrders,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: AppColor.greyDark),
              activeIcon: Icon(Icons.person, color: AppColor.primary),
              label: ConstString.profile,
            ),
          ],
        ),
      ),
    );
  }
}

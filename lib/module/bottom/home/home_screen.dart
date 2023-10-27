import 'package:carousel_slider/carousel_slider.dart';
import 'package:ft_washing_app/module/bottom/bottom_bar_controller.dart';
import 'package:ft_washing_app/module/bottom/home/home_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

import '../../../utils/images.dart';
import '../my_order/my_order_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put<HomeController>(HomeController());
  final bottomBarController = Get.find<BottomBarController>();
  final myOrderController = Get.put<MyOrderController>(MyOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0, top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              logo,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text("LauSol App",
                                style: const TextStyle().normal20w600),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            bottomBarController.selectedIndex.value = 3;

                          },
                          child: ClipOval(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: AppColor.primary.withOpacity(0.1),
                              child: const Icon(
                                Icons.person,
                                color: AppColor.gray600,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: homeController.sliderImages.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          homeController.sliderImages[itemIndex],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        homeController.currentIndex.value = index;
                      },
                      autoPlay: true,
                      aspectRatio: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: homeController.sliderImages.map((url) {
                        int index = homeController.sliderImages.indexOf(url);
                        return Container(
                          width: homeController.currentIndex.value == index
                              ? 9.0
                              : 6.0,
                          height: homeController.currentIndex.value == index
                              ? 9.0
                              : 6.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: homeController.currentIndex.value == index
                                ? AppColor.primary
                                : AppColor.grey, // Indicator color
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        HomeWidgetContainer(
                          onTap: () {
                            // Get.toNamed(AppRouter.productSelectionScreen);
                            bottomBarController.selectedIndex.value = 1;
                          },
                          icon: Icons.next_week_rounded,
                          color2: AppColor.primaryYellow,
                          color1: AppColor.primaryYellow.withOpacity(0.06),
                          text1: "20",
                          text2: ConstString.newOrders,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Obx(
                          ()=> HomeWidgetContainer(
                            onTap: () {
                              // Get.toNamed(AppRouter.myOrderScreen);
                              bottomBarController.selectedIndex.value = 2;
                            },
                            icon: Icons.my_library_books_sharp,
                            color2: AppColor.primary,
                            color1: AppColor.primary.withOpacity(0.06),
                            text1: myOrderController.order.length.toString(),
                            text2: ConstString.myOrders,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        HomeWidgetContainer(
                          onTap: () {
                            Get.toNamed(AppRouter.monthlyBag);
                          },
                          icon: Icons.shopping_bag_outlined,
                          color2: AppColor.primaryGreen,
                          color1: AppColor.primaryGreen.withOpacity(0.06),
                          text1: "3",
                          text2: "Our Plan",
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        HomeWidgetContainer(
                          onTap: () {
                            Get.toNamed(AppRouter.howWorks);
                          },
                          icon: Icons.cleaning_services,
                          color2: AppColor.primaryRed,
                          color1: AppColor.primaryRed.withOpacity(0.06),
                          text1: "",
                          text2: ConstString.howDoesItWork,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeWidgetContainer extends StatelessWidget {
  HomeWidgetContainer(
      {super.key,
      this.h,
      this.w,
      this.color1,
      this.text1,
      this.text2,
      this.onTap,
      this.color2,
      this.icon});

  Function()? onTap;
  double? h, w;
  Color? color1, color2;
  String? text1, text2;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: h ?? 160,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Container(
                    color: color2,
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      icon,
                      color: AppColor.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1 ?? "",
                        style: const TextStyle().normal40w500,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Text(
                          text2 ?? "",
                          style: const TextStyle()
                              .normal16w500
                              .textColor(color2 ?? Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

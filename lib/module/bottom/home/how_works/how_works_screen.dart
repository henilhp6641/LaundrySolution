import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ft_washing_app/module/bottom/home/how_works/how_works_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class HowWorksScreen extends StatefulWidget {
  const HowWorksScreen({super.key});

  @override
  State<HowWorksScreen> createState() => _HowWorksScreenState();
}

class _HowWorksScreenState extends State<HowWorksScreen> {
  final howDoesWorkController =
      Get.put<HowDoesWorkController>(HowDoesWorkController());
  PageController pageController = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        isShowBackButton: true,
        title: ConstString.howDoesItWork,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: howDoesWorkController.sliderImages.length,
                onPageChanged: (int index) {
                  howDoesWorkController.currentIndex.value = index;
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            howDoesWorkController.sliderImages[index].image ??
                                "",
                            height: 400,
                            // fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        howDoesWorkController.sliderImages[index].title ??
                            "".toString(),
                        style: const TextStyle().normal24Bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        howDoesWorkController.sliderImages[index].desc ??
                            "".toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle().normal16w400,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  howDoesWorkController.sliderImages.length,
                  (index) {
                    return Container(
                      width: howDoesWorkController.currentIndex.value == index
                          ? 9.0
                          : 6.0,
                      height: howDoesWorkController.currentIndex.value == index
                          ? 9.0
                          : 6.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: howDoesWorkController.currentIndex.value == index
                            ? AppColor.primary
                            : AppColor.grey, // Indicator color
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

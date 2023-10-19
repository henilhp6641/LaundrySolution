import 'package:ft_washing_app/package/config_packages.dart';

class HowDoesWorkController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxList<CustomClass> sliderImages = <CustomClass>[
    CustomClass(
      desc: "Select the services you need to place your order from app",
      title: "You place the order",
      image:
          "https://images.unsplash.com/photo-1567113463300-102a7eb3cb26?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
    ),
    CustomClass(
        desc: "We will collect the garments at the door of your house",
        title: "We withdraw",
        image:
            "https://fashionista.com/.image/t_share/MTcxMjI5NDkwMjkzMjU0MTI2/laundry-washing-clothes-coronavirus-covid19.jpg"),
    CustomClass(
        desc:
            "We use eco friendly detergents and treat your clothes with the utmost care",
        title: "We wash and care",
        image:
            "https://www.thespruce.com/thmb/4jTRSTlD2a-24rIO-sQmfuagS5o=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/laundry-products-everyone-needs-4150301-Hero-03-b713f6ce8cc84fd889187c05154d9625.jpg"),
    CustomClass(
      desc: "We will leave your order on the selected day and time",
      title: "We take it to your house",
      image:
          "https://4.imimg.com/data4/WQ/LR/ANDROID-24812648/product-500x500.jpeg",
    ),
  ].obs;
}

class CustomClass {
  String? image, title, desc;

  CustomClass({this.desc, this.image, this.title});
}

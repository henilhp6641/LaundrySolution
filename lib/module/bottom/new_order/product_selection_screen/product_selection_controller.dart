import 'package:ft_washing_app/package/config_packages.dart';

class ProductSelectionController extends GetxController {
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   for (int i = 0; i < productList.length; i++) {
  //     // productSelectionController
  //     //             .productList[i]['count'] <
  //     //         0
  //     //     ? (productSelectionController
  //     //         .total_count.value = 0)
  //     //     :
  //
  //     total_count = total_count + productList[i]['count'];
  //   }
  //   print(
  //       "HELLO HPOP${total_count}");
  // }

  void incrementCount(int index) {
    if (productList[index]['count'] < 0) {
      productList[index]['count'] = 0;
    } else {
      productList[index]['count']++;
      // for (int i = 0; i < productList.length; i++) {
      //   total = total + 5 * int.parse(productList[i]["count"].toString());
      // }
    }
    update();
  }

  void decrementCount(int index) {
    if (productList[index]['count'] <= 0) {
      productList[index]['count'] = 0;
    } else {
      productList[index]['count']--;
      // for (int i = 0; i < productList.length; i++) {
      //   total = total - 5 * int.parse(productList[i]["count"].toString());
      // }
    }

    update();
  }

  RxList productList = [
    {
      "product": "Jacket",
      "image": "asset/Order/jacket.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Dress",
      "image": "asset/Order/dress.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "T-shirt",
      "image": "asset/Order/tshirt.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Sweater",
      "image": "asset/Order/sweater.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Jeans",
      "image": "asset/Order/jeans.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Sportwear",
      "image": "asset/Order/sportwear.png",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Shorts",
      "image": "asset/Order/shorts.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Suit",
      "image": "asset/Order/suit.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Shirt",
      "image": "asset/Order/shirt.png",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Sock",
      "image": "asset/Order/socks.png",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Skirt",
      "image": "asset/Order/skirt.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Coat",
      "image": "asset/Order/coat.png",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Swimsuit",
      "image": "asset/Order/swim.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Waistcoat",
      "image": "asset/Order/waistcoat.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Hoodie",
      "image": "asset/Order/hoddie.jpeg",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Leggings",
      "image": "asset/Order/legis.png",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Overalls",
      "image": "asset/Order/overalls.png",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Cardigan",
      "image": "asset/Order/cardigan.png",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Pajamas",
      "image": "asset/Order/pajamas.png",
      "price": "\$5",
      "count": 0
    },
    {
      "product": "Blazer",
      "image": "asset/Order/blazer.png",
      "price": "\$5",
      "count": 0
    },
  ].obs;
}

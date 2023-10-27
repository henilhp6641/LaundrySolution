import '../../../../package/config_packages.dart';

import 'package:flutter/material.dart';

class LaundryOneScreen extends StatefulWidget {
  @override
  State<LaundryOneScreen> createState() => _LaundryOneScreenState();
}

class _LaundryOneScreenState extends State<LaundryOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        centerTitle: true,
        // title: ConstString.laundryLocation,
      ),
      backgroundColor: AppColor.white,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.local_laundry_service_outlined,
                  color: AppColor.primary,
                  size: 70,
                ),
                SizedBox(width: 20),
                Text(
                  'Laundry One',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Money saved',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '\$0',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Benefits',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text(
                  '\$0 Delivery Fee on Laundry Services'),
            ),
            const ListTile(
              leading: Icon(Icons.local_taxi),
              title:
                  Text('10% off eligible deliveries, and pickup orders'),
            ),
            const ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text('Exclusive offers and premium support'),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: (){
                  Get.toNamed(AppRouter.membershipScreen);
              },
              child: const ListTile(
                title: Text('Manage membership'),
                trailing: Icon(Icons.arrow_forward_ios, size: 14),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '*Benefits available only for eligible laundry stores marked with the Laundry One icon.',
              style: TextStyle(fontSize: 12),
            ),
            // You can continue adding the rest of the text in a similar manner.
          ],
        ),
      ),
    );
  }
}

import '../../../../package/config_packages.dart';

class LaundryLocation extends StatefulWidget {
  const LaundryLocation({super.key});

  @override
  State<LaundryLocation> createState() => _LaundryLocationState();
}

class _LaundryLocationState extends State<LaundryLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonAppBar(
        isShowBackButton: true,
        appBar: AppBar(),
        title: 'Nearest Laundry Location',
      ),
      body: Center(child: Text("Map"))
    );
  }
}

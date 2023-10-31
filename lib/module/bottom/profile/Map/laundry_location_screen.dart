
import '../../../../package/config_packages.dart';
import 'package:url_launcher/url_launcher.dart';
import '../profile_controller.dart';

class LaundryLocation extends StatefulWidget {
  const LaundryLocation({super.key});

  @override
  State<LaundryLocation> createState() => _LaundryLocationState();
}

class _LaundryLocationState extends State<LaundryLocation> {
  final profileController = Get.put<ProfileController>(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonAppBar(
        isShowBackButton: true,
        appBar: AppBar(),
        title: 'Nearest Laundry Location',
      ),
      body: Center(child: ElevatedButton(
          onPressed: launchURL,
          child: const Text("Redirect me to Nearby Laundry Location")))
    );
  }
  launchURL() async {
    String url = "https://www.google.com/maps/search/laundry+service/@${profileController.currentPosition!.latitude},${profileController.currentPosition!.longitude},13.33z?entry=ttu";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }
}

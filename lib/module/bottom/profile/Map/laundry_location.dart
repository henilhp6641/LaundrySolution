import '../../../../package/config_packages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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
      body: Center(child: ElevatedButton(
          onPressed: launchURL,
          child: Text("Google Map")))
    );
  }
  launchURL() async {
    const url = "https://www.google.com/maps/search/laundry+service/@45.4837179,-73.572568,13.33z?entry=ttu";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }
}

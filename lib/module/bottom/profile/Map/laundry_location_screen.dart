import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  final Completer<GoogleMapController> _controller = Completer();

  // static LatLng _center = LatLng(21.23867032695449, 72.8125602854095);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
     LatLng _center = LatLng(profileController.currentPosition!.latitude, profileController.currentPosition!.longitude);

    return Scaffold(
        appBar: CommonAppBar(
          isShowBackButton: true,
          appBar: AppBar(),
          title: 'Nearest Laundry Location',
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: launchURL,
                    backgroundColor: AppColor.primary,
                    child: const Icon(Icons.add_location, size: 36.0),
                  ) //const Text("Redirect me to Nearby Laundry Location")),
                  ),
            ),
          ],
        ));
  }

  launchURL() async {
    String url =
        "https://www.google.com/maps/search/laundry+service/@${profileController.currentPosition!.latitude},${profileController.currentPosition!.longitude},13.33z?entry=ttu";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }
}

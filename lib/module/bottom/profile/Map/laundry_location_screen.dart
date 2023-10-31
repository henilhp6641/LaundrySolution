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



  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    LatLng _center = LatLng(profileController.currentPosition!.latitude,
        profileController.currentPosition!.longitude);

    // List<Marker> markers = <Marker>[
    //   Marker(
    //       markerId: MarkerId('SomeId'),
    //       position: LatLng(61.52426801237001, 23.781180193817125),
    //       infoWindow: InfoWindow(title: 'The title of the marker'))
    // ];

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
              myLocationEnabled: true,
              // markers: Set<Marker>.of(markers),
              mapType: MapType.normal,
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

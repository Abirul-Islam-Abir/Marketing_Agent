import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../api services/shedules/store_lat_and_long.dart';
import '../../../../data/const/export.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import '../../../../data/utils/user_data_key.dart';

class MapScreenView extends StatefulWidget {
  const MapScreenView({super.key});

  @override
  State<MapScreenView> createState() => MapScreenViewState();
}

class MapScreenViewState extends State<MapScreenView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> markers = [];
  final List<LatLng> polylinePoints = [];
  GoogleMapController? mapController;
  final Location location = Location();
  LatLng? userLocation;
  String currentLocationName =
      'Loading...'; // Updated variable for location name
  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(23.8041, 90.4152),
    zoom: 17.4746,
  );

  Future<void> getCurrentLocation() async {

    final token = await box.read(UserDataKey.tokenKey);
    final currentId = box.read(UserDataKey.currentTargetIdKey);
    Future.delayed(Duration(seconds: 5)).then((value) => updateLocation());
    try {
      final permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.granted) {
        location.onLocationChanged.listen((LocationData currentLocation) {
          userLocation =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          if (mounted) {
            setState(() {});
          }

          updateCurrentLocationName();
        });
      } else {
        getCurrentLocation();
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        getCurrentLocation();
      }
    }
  }

  Future<void> updateLocation() async {
    final GoogleMapController controller = await _controller.future;
    if (userLocation != null) {
      polylinePoints
          .add(LatLng(userLocation!.latitude, userLocation!.longitude));
      if (mounted) {
        setState(() {});
      }
      addMarkerPosition();
      await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(userLocation!.latitude, userLocation!.longitude),
          tilt: 59.440717697143555,
          zoom: 17.00,
        ),
      ));
    }
  }

  Future<void> updateCurrentLocationName() async {
    try {
      if (userLocation != null) {
        List<geocoding.Placemark> placemarks =
            await geocoding.placemarkFromCoordinates(
          userLocation!.latitude,
          userLocation!.longitude,
        );

        if (placemarks.isNotEmpty) {
          geocoding.Placemark placemark = placemarks[0];
          String name = placemark.name ?? '';
          String thoroughfare = placemark.thoroughfare ?? '';
          String locality = placemark.locality ?? '';

          currentLocationName = '$name $thoroughfare, $locality';
          if (mounted) {
            setState(() {});
          }
        }
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  void addMarkerPosition() {
    const MarkerId markerId = MarkerId('markerId');
    Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(userLocation?.latitude ?? 0, userLocation?.longitude ?? 0),
      infoWindow: InfoWindow(
        title: 'My Current Location!',
        snippet: 'Lat:${userLocation!.latitude},Lng:${userLocation!.longitude}',
      ),
    );
    markers.add(marker);
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  final _bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _bottomNavController.selectIndex(0);
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onTap: (v) {},
                    mapType: MapType.normal,
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId("tracking"),
                        color: Colors.blue,
                        points: polylinePoints,
                        width: 5,
                      )
                    },
                    markers: Set<Marker>.of(markers),
                    initialCameraPosition: cameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
            Positioned(
              top: 10,
              right: 50,
              left: 50,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                  child: Text(
                    currentLocationName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../data/const/export.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:amin_agent/app/api%20services/shedules/store_lat_and_long.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:amin_agent/app/modules/Fcm%20Notification/document/documents.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class MapDefault extends StatefulWidget {
  const MapDefault(
      {super.key,
      required this.lat,
      required this.lang,
      required this.name,
      required this.avatar,
      required this.id,
      required this.time});

  final double lat;
  final double lang;
  final String name;
  final String avatar;
  final String id;
  final String time;

  @override
  State<MapDefault> createState() => MapDefaultState();
}

class MapDefaultState extends State<MapDefault> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<Marker> markers = [];
  List<LatLng> polylinePoints = [];
  GoogleMapController? mapController;
  final Location location = Location();
  LatLng? userLocation;

  bool isValidCoordinates(double lat, double lng) {
    // Check if the coordinates are within valid ranges
    return (lat >= -90 && lat <= 90) && (lng >= -180 && lng <= 180);
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
      // Handle network errors or other exceptions
      print('Error fetching location details: $e');
      // Retry mechanism
      // Retry after a delay
      Future.delayed(const Duration(seconds: 5), () {
        updateCurrentLocationName();
      });
    }
  }

  Future<void> updateChamberLocationName() async {
    try {
      if (isValidCoordinates(widget.lat, widget.lang)) {
        List<geocoding.Placemark> placemarks =
            await geocoding.placemarkFromCoordinates(
          widget.lat,
          widget.lang,
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
      } else {
        // Handle invalid coordinates error
        print('Invalid coordinates: ${widget.lat}, ${widget.lang}');
      }
    } catch (e) {
      // Handle other exceptions, e.g., network errors
      print('Error fetching location details: $e');
    }
  }

  // Function to add markers
  void addMarkerPosition(lat, lang) {
    final MarkerId markerId = MarkerId('markerId');
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(lat, lang),
      infoWindow: InfoWindow(
          title: 'My Current Location!',
          snippet:
              'Lat:${userLocation!.latitude},Lng:${userLocation!.longitude}'),
    );
    markers.clear();
    markers.add(marker);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> onLocationChanged() async {
    final token = await box.read(UserDataKey.tokenKey);
    final currentId = box.read(UserDataKey.currentTargetIdKey);

    location.onLocationChanged.listen((position) {
      userLocation = LatLng(position.latitude!, position.longitude!);
      storeLatAndLongRequest(
          uid: widget.id,
          completionLat: position.latitude.toString(),
          token: token,
          id: currentId,
          completionLang: position.longitude.toString());
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    polylinePoints.add(LatLng(widget.lat, widget.lang));
    getCurrentLocation();
    updateChamberLocationName();
    addMarkerPosition(widget.lat, widget.lang);
  }

  late StreamSubscription<LocationData> locationSubscription;

  Future<void> getCurrentLocation() async {
    final token = await box.read(UserDataKey.tokenKey);
    final currentId = await box.read(UserDataKey.currentTargetIdKey);
    try {
      final permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.granted) {
        locationSubscription = location.onLocationChanged.listen(
          (LocationData currentLocation) {
            userLocation = LatLng(
              currentLocation.latitude!,
              currentLocation.longitude!,
            );

            if (mounted) {
              setState(() {});
            }
            storeLatAndLongRequest(
                uid: currentId,
                completionLat: currentLocation.latitude.toString(),
                token: token,
                id: currentId,
                completionLang: currentLocation.longitude.toString());
          },
        );
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        getCurrentLocation();
      }
    }
  }

  String currentLocationName =
      'Loading...'; // Updated variable for location name
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              polylines: {
                Polyline(
                  polylineId: PolylineId("tracking"),
                  color: Colors.blue,
                  points: polylinePoints,
                  width: 5,
                )
              },
              markers: Set<Marker>.of(markers),
              initialCameraPosition: CameraPosition(
                  target: LatLng(widget.lat, widget.lang), zoom: 15),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
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
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserCardLocation(
                    title: widget.name,
                    subtitle: widget.time,
                    image: widget.avatar,
                    sendTap: () async {
                      updateCurrentLocationName();
                      await mapController!
                          .animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                          bearing: 192.8334901395799,
                          target: LatLng(
                              userLocation!.latitude, userLocation!.longitude),
                          tilt: 59.440717697143555,
                          zoom: 17.00,
                        ),
                      ));
                      polylinePoints.add(LatLng(
                          userLocation!.latitude, userLocation!.longitude));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
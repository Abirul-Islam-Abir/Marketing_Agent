import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geocoding/geocoding.dart' as geocoding;

import '../../../../api services/shedules/store_lat_and_long.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../Fcm Notification/document/documents.dart';

class MapScreenNavigate extends StatefulWidget {
  const MapScreenNavigate(
      {Key? key, required this.lat, required this.long, required this.uid})
      : super(key: key);
  final String lat;
  final String long;
  final String uid;

  @override
  State<MapScreenNavigate> createState() => MapScreenNavigateState();
}

class MapScreenNavigateState extends State<MapScreenNavigate> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<Marker> markers = [];
  List<LatLng> polylinePoints = [];
  final PolylinePoints polylinePointHelper = PolylinePoints();
  GoogleMapController? mapController;
  final Location location = Location();
  LatLng? userLocation;
  String currentLocationName = 'Loading...';
  late StreamSubscription<LocationData> locationSubscription;

  Future<void> getDirections() async {
    final String apiUrl =
        "https://maps.googleapis.com/maps/api/directions/json";
    final String origin =
        "origin=${userLocation?.latitude},${userLocation?.longitude}" ?? "";
    final String destination = "destination=${widget.lat},${widget.long}";

    final String apiKey = GoogleMapKey.AndroidMapKey;

    final String url = "$apiUrl?$origin&$destination&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the response and handle directions data
      Map<String, dynamic> data = json.decode(response.body);

      // Extract encoded polyline from the response
      String encodedPolyline = data['routes'][0]['overview_polyline']['points'];

      // Decode the polyline into a list of LatLng points
      List<PointLatLng> decodedPolyline =
          polylinePointHelper.decodePolyline(encodedPolyline);

      // Clear existing polyline points
      setState(() {
        polylinePoints.clear();
      });

      // Add decoded polyline points to the state
      setState(() {
        decodedPolyline.forEach((PointLatLng point) {
          polylinePoints.add(LatLng(point.latitude, point.longitude));
        });
      });

      // Process the directions data as needed
    } else {
      // Handle errors
      print("Error: ${response.statusCode}");
    }
  }

  Future<void> getCurrentLocation() async {
    final id = await box.read(UserDataKey.currentTargetIdKey);
    final token = await box.read(UserDataKey.tokenKey);
    try {
      final permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.granted) {
        locationSubscription = location.onLocationChanged.listen(
          (LocationData currentLocation) {
            setState(() {
              userLocation = LatLng(
                currentLocation.latitude!,
                currentLocation.longitude!,
              );
            });

            storeLatAndLongRequest(
                id: id,
                token: token,
                completionLang: userLocation!.longitude,
                completionLat: userLocation!.latitude,
                uid: widget.uid);
            updateLocation();
          },
        );
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
      setState(() {
        polylinePoints
            .add(LatLng(userLocation!.latitude, userLocation!.longitude));
      });
      addMarkerPosition();
      polylinePoints.add(
        LatLng(userLocation!.latitude, userLocation!.longitude),
      );
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(userLocation!.latitude, userLocation!.longitude),
            tilt: 59.440717697143555,
            zoom: 17.00,
          ),
        ),
      );
    }
  }

  BitmapDescriptor customMarkerIcon = BitmapDescriptor.defaultMarker;

  Future<void> setCustomMarkerIcon() async {
    customMarkerIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      'assets/images/img_location_svgrepo_com.png',
    );
  }

  Future<void> updateCurrentLocationName() async {
    try {
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(
        double.parse(widget.lat),
        double.parse(widget.long),
      );

      if (placemarks.isNotEmpty) {
        geocoding.Placemark placemark = placemarks[0];
        String name = placemark.name ?? '';
        String thoroughfare = placemark.thoroughfare ?? '';
        String locality = placemark.locality ?? '';
        setState(() {
          currentLocationName = '$name $thoroughfare, $locality';
        });
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  void addMarkerPosition() {
    const MarkerId markerId = MarkerId('markerId');
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(userLocation!.latitude, userLocation!.longitude),
      infoWindow: InfoWindow(
        title: 'My Current Location!',
        snippet: 'Lat:${userLocation!.latitude},Lng:${userLocation!.longitude}',
      ),
    );
    markers.add(marker);

    setState(() {});
  }

  Future<void> userAddMarker() async {
    final GoogleMapController controller = await _controller.future;
    const MarkerId markerId = MarkerId('userAddMarker');
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(double.parse(widget.lat), double.parse(widget.long)),
      infoWindow: InfoWindow(
        title: 'My Current Location!',
        snippet: 'Lat:${widget.lat},Lng:${widget.long}',
      ),
    );
    updateCurrentLocationName();
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(double.parse(widget.lat), double.parse(widget.long)),
          tilt: 59.440717697143555,
          zoom: 17.00,
        ),
      ),
    );
    markers.add(marker);
    polylinePoints.add(
      LatLng(
        double.parse(widget.lat),
        double.parse(widget.long),
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    userAddMarker();
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the location subscription to avoid memory leaks
    locationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
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
            initialCameraPosition: CameraPosition(
              target:
                  LatLng(double.parse(widget.lat), double.parse(widget.long)),
              zoom: 17.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              getDirections(); // Call getDirections here or wherever needed
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
        ],
      ),
    );
  }
}
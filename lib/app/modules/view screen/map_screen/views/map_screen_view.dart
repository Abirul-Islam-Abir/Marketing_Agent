import 'dart:async';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

import '../../../../data/dummy data/schedule_dummy_data.dart';
import '../../../../data/utils/utils.dart';
import '../../../../theme/app_color.dart';
import '../components/user_card_location.dart';

class MapScreenView extends StatefulWidget {
  const MapScreenView({Key? key}) : super(key: key);

  @override
  State<MapScreenView> createState() => MapScreenViewState();
}

class MapScreenViewState extends State<MapScreenView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> markers = [Marker(
    markerId: MarkerId('m'),
    position:
    LatLng(23.80535022486723, 90.41394229978323),
    infoWindow: InfoWindow(
        title: 'My Current Location!',
        snippet:
        'Lat:23.80535022486723,Lng: 90.41394229978323'),
  )];
  final List<LatLng> polylinePoints = [
    LatLng(23.804039775855614, 90.4152699932456),
    LatLng(23.80530206487308, 90.41533570736647),
    LatLng(23.80535022486723, 90.41394229978323),
  ];
  GoogleMapController? mapController;
  final Location location = Location();
  LatLng? userLocation;
  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(23.8041, 90.4152),
    zoom: 17.4746,
  );

  Future<void> getCurrentLocation() async {
    try {
      final PermissionStatus permissionStatus =
          await location.requestPermission();
      if (permissionStatus == PermissionStatus.granted) {
       // onLocationChanged();
        updateLocation();
        setState(() {});
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
        // polylinePoints.clear();
      });
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

  // Function to add markers
  void addMarkerPosition() {
    //markers.clear();
    const MarkerId markerId = MarkerId('markerId');
    Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(userLocation?.latitude ?? 0, userLocation?.longitude ?? 0),
      infoWindow: InfoWindow(
          title: 'My Current Location!',
          snippet:
              'Lat:${userLocation!.latitude},Lng:${userLocation!.longitude}'),
    );
    markers.add(marker);
    setState(() {});
  }

  // Function to change the map type
  void onMapTypeChanged(MapType newMapType) {
    setState(() {
      currentMapType = newMapType;
    });
  }

  void onLocationChanged() {
    location.onLocationChanged.listen((position) {
      userLocation = LatLng(position.latitude!, position.longitude!);
      polylinePoints.add(userLocation!);
      addMarkerPosition();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            onTap: (v) {
              print('$v==========================');
            },
            mapType: currentMapType,
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
          const Positioned(
            top: 10,
            right: 50,
            left: 50,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                child: Text(
                  '47 Streat, Florida',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColor.kBlackColor),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 10,
            left: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCardLocation(
                  sendTap: () {
                    getCurrentLocation();
                  },
                  image: scheduleList[0].imageUrl,
                  subtitle: scheduleList[0].subtitle,
                  title: scheduleList[0].title,
                ),
                UserCardLocation(
                  sendTap: completedLocationTaskDialog,
                  image: scheduleList[0].imageUrl,
                  subtitle: scheduleList[0].subtitle,
                  title: scheduleList[0].title,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MapType currentMapType = MapType.normal;
  List<MapType> availableMapTypes = [
    MapType.normal,
    MapType.satellite,
    MapType.hybrid,
    MapType.terrain,
  ];
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Searching for $query...'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can add suggestions here if needed
    return const SizedBox.shrink();
  }
}

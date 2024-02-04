import 'package:amin_agent/app/api%20services/shedules/store_lat_and_long.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:amin_agent/app/modules/Fcm%20Notification/document/documents.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart' as geocoding;

import '../../../../data/const/export.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double lang;
  final String name;
  final String avatar;
  final String id;
  final String time;

  const MapScreen(
      {super.key,
      required this.lat,
      required this.lang,
      required this.name,
      required this.avatar,
      required this.id,
      required this.time});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

/*  double _originLatitude = 23.8956812, _originLongitude = 90.3732179;
  double _destLatitude = 23.8737067, _destLongitude = 90.3628324;*/
  /* double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
  double _destLatitude = 6.849660, _destLongitude = 3.648190;*/
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = GoogleMapKey.AndroidMapKey;
  LatLng? userLocation;
  late StreamSubscription<LocationData> locationSubscription;
  final Location location = Location();
  String currentLocationName =
      'Loading...'; // Updated variable for location name
  Future<void> getCurrentLocation() async {
    final token = await box.read(UserDataKey.tokenKey);
    final currentId = await box.read(UserDataKey.currentTargetIdKey);
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
                uid: widget.id,
                completionLat: widget.lat,
                token: token,
                id: currentId,
                completionLang: widget.lang);
          },
        );
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        getCurrentLocation();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _addMarker(LatLng(widget.lat, widget.lang), "origin",
        BitmapDescriptor.defaultMarker);
    getCurrentLocation();
    updateChamberLocationName();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(widget.lat, widget.lang), zoom: 15),
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(markers.values),
            polylines: Set<Polyline>.of(polylines.values),
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
                    _addMarker(
                        LatLng(userLocation!.latitude, userLocation!.longitude),
                        "destination",
                        BitmapDescriptor.defaultMarker);
                    updateCurrentLocationName();
                    await mapController
                        .animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                        bearing: 192.8334901395799,
                        target: LatLng(
                            userLocation!.latitude, userLocation!.longitude),
                        tilt: 59.440717697143555,
                        zoom: 17.00,
                      ),
                    ));
                    _getPolyline();
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
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

          setState(() {
            currentLocationName = '$name $thoroughfare, $locality';
          });
        }
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> updateChamberLocationName() async {
    try {
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

        setState(() {
          currentLocationName = '$name $thoroughfare, $locality';
        });
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(widget.lat, widget.lang),
        PointLatLng(userLocation!.latitude, userLocation!.longitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
}
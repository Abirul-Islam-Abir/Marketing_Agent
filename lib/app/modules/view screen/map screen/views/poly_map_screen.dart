import 'package:amin_agent/app/modules/Fcm%20Notification/document/documents.dart';
import 'package:amin_agent/app/modules/view%20screen/schedule%20screen/components/schedule_card.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../data/const/export.dart';
import '../../../Fcm Notification/controller/fcm_notification_controller.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
/*  double _originLatitude = 23.8956812, _originLongitude = 90.3732179;
  double _destLatitude = 23.8737067, _destLongitude = 90.3628324;*/
  double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
  double _destLatitude = 6.849660, _destLongitude = 3.648190;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey =  GoogleMapKey.AndroidMapKey;
  LatLng? userLocation;
  late StreamSubscription<LocationData> locationSubscription;
  final Location location = Location();

  Future<void> getCurrentLocation() async {
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
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
        BitmapDescriptor.defaultMarker);
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(

            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(_originLatitude, _originLongitude), zoom: 15),
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
                      'currentLocationName',
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
                    UserCardLocation(title: 'title', subtitle: 'subtitle', image:'',sendTap: () {
                      _addMarker(LatLng(userLocation!.latitude, userLocation!.longitude), "destination",
                          BitmapDescriptor.defaultMarker);
                      _getPolyline();
                    },),
                  ],
                ),
              ),
            ],
          )),
    );
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
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
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
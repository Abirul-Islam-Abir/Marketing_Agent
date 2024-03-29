
import 'package:geocoding/geocoding.dart' as geocoding;

import '../../../../data/const/export.dart';

class MapScreenController extends GetxController {
  List<Marker> markers = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  late GoogleMapController googleMapController;
  final Completer<GoogleMapController> completer = Completer();

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    if (!completer.isCompleted) {
      completer.complete(controller);
    }
  }

  onMapChange(newLatLng) async {
    await addMarker(newLatLng);
    locationNameUpdate(userLocation!.latitude, userLocation!.longitude);
    update();
  }

  Future<void> locationNameUpdate(lat, lang) async {
    try {
      if (userLocation != null) {
        List<geocoding.Placemark> placemarks =
            await geocoding.placemarkFromCoordinates(lat, lang);
        if (placemarks.isNotEmpty) {
          geocoding.Placemark placemark = placemarks[0];
          String name = placemark.name ?? '';
          String thoroughfare = placemark.thoroughfare ?? '';
          String locality = placemark.locality ?? '';
          currentLocationName = '$name $thoroughfare, $locality';
          update();
        }
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  addMarker(latLng) {
    markers.add(Marker(
        consumeTapEvents: true,
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        onTap: () {
          markers.removeWhere(
              (element) => element.markerId == MarkerId(latLng.toString()));
          if (markers.length > 1) {
            getDirections(markers);
          } else {
            polylines.clear();
          }
          update();
        }));
    if (markers.length > 1) {
      getDirections(markers);
    }

    update();
  }

  getDirections(List<Marker> markers) async {
    List<LatLng> polylineCoordinates = [];
    List<PolylineWayPoint> polylineWayPoints = [];
    for (var i = 0; i < markers.length; i++) {
      polylineWayPoints.add(PolylineWayPoint(
          location:
              "${markers[i].position.latitude.toString()},${markers[i].position.longitude.toString()}",
          stopOver: true));
    }
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GoogleMapKey.androidMapKey, //GoogleMap ApiKey
      PointLatLng(
          markers.first.position.latitude, markers.first.position.longitude),
      PointLatLng(
          markers.last.position.latitude, markers.last.position.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
     }

    update();
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColor.kRedColor,
      points: polylineCoordinates,
      width: 10,
    );
    polylines[id] = polyline;

    update();
  }

  String currentLocationName =
      'Loading...'; // Updated variable for location name

  final Location location = Location();
  late StreamSubscription<LocationData> locationSubscription;
  LatLng? userLocation;

  Future<void> getCurrentLocation() async {
    try {
      final permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.granted) {
        locationSubscription = location.onLocationChanged.listen(
          (LocationData currentLocation) {
            userLocation = LatLng(
              currentLocation.latitude!,
              currentLocation.longitude!,
            );
            update();
          },
        );
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        getCurrentLocation();
      }
    }
  }

 /* @override
  void onInit() {
    getCurrentLocation().then((value) =>
        locationNameUpdate(userLocation!.latitude, userLocation!.longitude)
            .then((value) async => await addMarker(
                LatLng(userLocation!.latitude, userLocation!.longitude))));
    super.onInit();
  }*/
}
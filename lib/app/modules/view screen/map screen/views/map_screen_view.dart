import '../../../../data/const/export.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class MapScreenView extends StatefulWidget {
  const MapScreenView(
      {Key? key, required this.lat, required this.long, required this.isLatLng})
      : super(key: key);
  final String lat;
  final String long;
  final bool isLatLng;
  @override
  State<MapScreenView> createState() => MapScreenViewState();
}

class MapScreenViewState extends State<MapScreenView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<Marker> markers = [

  ];
  final List<LatLng> polylinePoints = [];
  GoogleMapController? mapController;
  final Location location = Location();
  LatLng? userLocation;
  String currentLocationName =
      'Loading...'; // Updated variable for location name


  Future<void> getCurrentLocation() async {
    try {
      final permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.granted) {
        location.onLocationChanged.listen((LocationData currentLocation) {
          setState(() {
            userLocation =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
          });
          userAddMarker();
          updateLocation();
          updateCurrentLocationName();
        });
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
      if (widget.isLatLng == true) {
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
        snippet: 'Lat:${widget.lat},Lng:${widget.long}',
      ),
    );
    markers.add(marker);
    setState(() {});
  }
  void userAddMarker() {
    const MarkerId markerId = MarkerId('markerId');
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(double.parse(widget.lat), double.parse(widget.long)),
      infoWindow: InfoWindow(
        title: 'My Current Location!',
        snippet: 'Lat:${widget.lat},Lng:${widget.long}',
      ),
    );
    markers.add(marker);
    setState(() {});
  }
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
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
            initialCameraPosition:  CameraPosition(
              target: LatLng(double.parse(widget.lat),double.parse(widget.long)),
              zoom: 17.4746,
            ),
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
          const Positioned(
            bottom: 100,
            right: 10,
            left: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Your other widgets here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

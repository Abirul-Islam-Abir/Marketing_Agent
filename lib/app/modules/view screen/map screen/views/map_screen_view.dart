import '../../../../data/const/export.dart';

class MapScreenView extends StatefulWidget {
  const MapScreenView({Key? key}) : super(key: key);

  @override
  State<MapScreenView> createState() => MapScreenViewState();
}

class MapScreenViewState extends State<MapScreenView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> markers = [
    const Marker(
      markerId: MarkerId('m'),
      position: LatLng(23.80535022486723, 90.41394229978323),
      infoWindow: InfoWindow(
          title: 'My Current Location!',
          snippet: 'Lat:23.80535022486723,Lng: 90.41394229978323'),
    )
  ];
  final List<LatLng> polylinePoints = [
    const LatLng(23.804039775855614, 90.4152699932456),
    const LatLng(23.80530206487308, 90.41533570736647),
    const LatLng(23.80535022486723, 90.41394229978323),
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
        polylinePoints
            .add(LatLng(userLocation!.latitude, userLocation!.longitude));
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

  MapType currentMapType = MapType.normal;
  List<MapType> availableMapTypes = [
    MapType.normal,
    MapType.satellite,
    MapType.hybrid,
    MapType.terrain,
  ];
  @override
  void initState() {
    getCurrentLocation();
    polylinePoints.addAll([
      const LatLng(24.762189564828716, 88.13209619755345),
      const LatLng(24.813744055051384, 88.14567206678025),
    ]);
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
                  sendTap: (){},
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
}

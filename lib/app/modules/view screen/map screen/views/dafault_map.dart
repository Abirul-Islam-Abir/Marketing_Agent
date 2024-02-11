
import '../../../../data/const/export.dart';

class DefaultMap extends StatelessWidget {

  final controller = Get.put(DefaultMapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DefaultMapController>(builder: (logic) {
        return Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              onMapCreated: controller.onMapCreated,
              polylines: Set<Polyline>.of(controller.polylines.values),
              initialCameraPosition: CameraPosition(
                  target: LatLng(controller.lat, controller.lang), zoom: 10),
              markers: controller.markers.toSet(),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            //  onTap: controller.onMapChange,
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
                    controller.currentLocationName,
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
                    title: controller.name,
                    subtitle: controller.time,
                    image: controller.avatar,
                    sendTap: controller.currentLocation,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
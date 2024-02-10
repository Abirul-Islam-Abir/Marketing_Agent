// adding packages
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart' as geocoding;

import '../../../../api services/shedules/store_lat_and_long.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../Fcm Notification/document/documents.dart';
import '../components/user_card_location.dart';
import '../controllers/default_map_controller.dart';

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
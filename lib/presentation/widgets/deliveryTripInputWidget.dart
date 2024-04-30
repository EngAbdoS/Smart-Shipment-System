import 'package:flutter/material.dart';

//import 'package:google_maps/google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryTripInputWidget extends StatelessWidget {
  DeliveryTripInputWidget({super.key});

  final googlePlex = LatLng(31.151897, 31.934281);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,width: double.maxFinite,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: googlePlex, zoom: 13),
      ),
    );
  }
}

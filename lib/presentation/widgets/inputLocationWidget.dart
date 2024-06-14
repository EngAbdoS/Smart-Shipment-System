import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

Widget inputLocationWidget(BuildContext context, Function setLocation,
    String label, String save, String hint) {
  final TextEditingController fromLocationTextEditingController =
      TextEditingController();

  return TextFormField(
    readOnly: true,
    onTap: () async => pickLocation(
        context, setLocation, fromLocationTextEditingController, save, hint),
    controller: fromLocationTextEditingController,
    decoration: InputDecoration(
      labelText: label.tr(),
      hintText: hint.tr(),
      // errorText: (() ?? true) || true
      //     ? null
      //     : AppStrings.fromLocationHint.tr(),
    ),
  );
}

pickLocation(
    BuildContext context,
    Function setCurrentLocation,
    TextEditingController controller,
    String locationMassage,
    String locationMassageHint) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        body: OpenStreetMapSearchAndPick(
            buttonColor: ColorManager.primary,
            locationPinIconColor: ColorManager.primary,
            buttonText: locationMassage.tr(),
            hintText: locationMassageHint.tr(),
            locationPinTextStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: ColorManager.primary),
            onPicked: (pickedData) {
              setCurrentLocation(
                  LatLng(pickedData.latLong.latitude,
                      pickedData.latLong.longitude),
                  pickedData.address['state'] ?? "a7a",
                  pickedData.addressName);
              controller.text = pickedData.addressName;
              Navigator.of(context).pop();
            }),
      ),
    ),
  );
}

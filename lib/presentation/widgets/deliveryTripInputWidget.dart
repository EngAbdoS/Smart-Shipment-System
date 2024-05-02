import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

class DeliveryTripInputWidget extends StatelessWidget {
  DeliveryTripInputWidget(
      {super.key,
      required Function addDeliveryTrip,
      required this.fromLocationTextEditingController,
      required this.toLocationTextEditingController,
      required this.startTimeLocationTextEditingController,
      required this.expectedDurationTextEditingController,
      required this.tripDetailsTextEditingController,
      required this.tripDaysLocationTextEditingController});

  final TextEditingController fromLocationTextEditingController;
  final TextEditingController toLocationTextEditingController;
  final TextEditingController startTimeLocationTextEditingController;
  final TextEditingController expectedDurationTextEditingController;
  final TextEditingController tripDetailsTextEditingController;
  final TextEditingController tripDaysLocationTextEditingController;

  final googlePlex = LatLng(31.151897, 31.934281);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      width: double.maxFinite,
      child: Column(
        children: [
          TextFormField(
            //  enabled: false,
            readOnly: true,
            onTap: () async {
              fromLocationTextEditingController.text = "a7a";
              // pickedDate = await showDatePicker(
              //     initialEntryMode: DatePickerEntryMode.calendarOnly,
              //     // initialEntryMode=DatePickerEntryMode.input,
              //     // barrierColor: ColorManager.primary,
              //     context: context,
              //     initialDate: DateTime.now(),
              //     firstDate: DateTime(1950),
              //     lastDate: DateTime(2100));
              // setDateOfBirth(pickedDate ?? DateTime(0));
              // dateOfBirthTextEditingController.text =
              // "${pickedDate?.year ?? "0"}-${pickedDate?.month ?? "0"}-${pickedDate?.day ?? "0"}";
            },

            controller: fromLocationTextEditingController,
            decoration: InputDecoration(
              labelText: AppStrings.fromLocation.tr(),
              hintText: AppStrings.fromLocationHint.tr(),
              errorText: (isFromLocationValid() ?? true)
                  ? null
                  : AppStrings.fromLocationHint.tr(),
            ),
          )
        ],
      ),
    );
  }

  bool? isFromLocationValid() {
    return fromLocationTextEditingController.text.isEmpty;
  }
}

class eliveryTripInputWidget extends StatelessWidget {
  eliveryTripInputWidget({super.key});

  final googlePlex = LatLng(31.151897, 31.934281);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.maxFinite,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: googlePlex, zoom: 13),
      ),
    );
  }
}

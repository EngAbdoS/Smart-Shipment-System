import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:location/location.dart';
import 'package:smart_shipment_system/presentation/resources/theme_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';

class DeliveryTripInputWidget extends StatefulWidget {
  DeliveryTripInputWidget(
      {super.key,
      required this.addDeliveryTrip,
      required this.setCurrentFromLocationAndGov,
      required this.setCurrentToLocationAndGov,
      required this.setCurrentTripDetailsLocation,
      required this.setCurrentTripStartTime,
      required this.setCurrentTripExpectedDuration,
      required this.fromLocationTextEditingController,
      required this.toLocationTextEditingController,
      required this.startTimeLocationTextEditingController,
      required this.expectedDurationTextEditingController,
      required this.tripDetailsTextEditingController,
      required this.tripDaysLocationTextEditingController,
      required this.outputFromLocation,
      required this.outputToLocation,
      required this.outputStartTime,
      required this.outputExpectedDuration,
      required this.outputTripDetails});

  final Stream<String> outputFromLocation;
  final Stream<String> outputToLocation;
  final Stream<String> outputStartTime;
  final Stream<bool> outputExpectedDuration;
  final Stream<bool> outputTripDetails;

  //final Stream<String> outputTripDays;

  final TextEditingController fromLocationTextEditingController;
  final TextEditingController toLocationTextEditingController;
  final TextEditingController startTimeLocationTextEditingController;
  final TextEditingController expectedDurationTextEditingController;
  final TextEditingController tripDetailsTextEditingController;
  final TextEditingController tripDaysLocationTextEditingController;
  Function addDeliveryTrip;
  Function setCurrentFromLocationAndGov;
  Function setCurrentToLocationAndGov;
  Function setCurrentTripDetailsLocation;
  Function setCurrentTripStartTime;
  Function setCurrentTripExpectedDuration;

  @override
  State<DeliveryTripInputWidget> createState() =>
      _DeliveryTripInputWidgetState();
}

class _DeliveryTripInputWidgetState extends State<DeliveryTripInputWidget> {
  // final googlePlex = const LatLng(31.151897, 31.934281);
  TimeOfDay? tripTime;

  void _bind() {
    widget.outputFromLocation.listen(
        (location) => widget.fromLocationTextEditingController.text = location);
    widget.outputToLocation.listen(
        (location) => widget.toLocationTextEditingController.text = location);
    widget.outputStartTime.listen((location) =>
        widget.startTimeLocationTextEditingController.text = location);
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p22),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ColorManager.primary.withOpacity(0.3), blurRadius: 30)
            ],
            color: ColorManager.offWhite,
            borderRadius: BorderRadius.circular(20)),
        // height: 400,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              height: 15.sp,
            ),
            TextFormField(
              //  enabled: false,
              readOnly: true,
              onTap: () async => pickLocation(
                  context,
                  widget.setCurrentFromLocationAndGov,
                  "ميتين ام اللوكيشن",
                  "اختار ميتين ام اللوكيشن"),

              controller: widget.fromLocationTextEditingController,
              decoration: InputDecoration(
                labelText: AppStrings.fromLocation.tr(),
                hintText: AppStrings.fromLocationHint.tr(),
                // errorText: (() ?? true) || true
                //     ? null
                //     : AppStrings.fromLocationHint.tr(),
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
            TextFormField(
              //  enabled: false,
              readOnly: true,
              onTap: () async => pickLocation(
                  context,
                  widget.setCurrentToLocationAndGov,
                  "ميتين ام اللوكيشن",
                  "اختار ميتين ام اللوكيشن"),

              controller: widget.toLocationTextEditingController,
              decoration: InputDecoration(
                labelText: AppStrings.toLocation.tr(),
                hintText: AppStrings.toLocationHint.tr(),
                // errorText: (() ?? true) || true
                //     ? null
                //     : AppStrings.fromLocationHint.tr(),
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
            StreamBuilder<bool>(
                stream: widget.outputTripDetails,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (tripDetails) =>
                        widget.setCurrentTripDetailsLocation(tripDetails),
                    keyboardType: TextInputType.text,
                    controller: widget.tripDetailsTextEditingController,
                    decoration: InputDecoration(
                      hintText: AppStrings.tripDetailsHint.tr(),
                      labelText: AppStrings.tripDetails.tr(),
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.tripDetailsHint.tr(),
                    ),
                  );
                }),
            SizedBox(
              height: 15.sp,
            ),
            StreamBuilder<bool>(
                stream: widget.outputExpectedDuration,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (duration) => widget
                        .setCurrentTripExpectedDuration(int.parse(duration)),
                    keyboardType: TextInputType.number,
                    controller: widget.expectedDurationTextEditingController,
                    decoration: InputDecoration(
                      hintText: AppStrings.tripExDurationHint.tr(),
                      labelText: AppStrings.tripExDuration.tr(),
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.tripExDurationHint.tr(),
                    ),
                  );
                }),

            SizedBox(
              height: 15.sp,
            ),
            TextFormField(
              //  enabled: false,
              readOnly: true,
              onTap: () async => {
                tripTime = await showTimePicker(
                    // barrierColor: ColorManager.primary,
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) {
                      return Theme(
                        data: (context.locale == ENGLISH_LOCAL
                                ? getAppTheme()
                                : getArabicAppTheme())
                            .copyWith(
                          timePickerTheme: TimePickerTheme.of(context).copyWith(
                            dialHandColor: ColorManager.primary,
                            // dialTextColor:  ColorManager.primary,
                          ),
                        ),
                        child: child!,
                      );
                    }),
                widget.setCurrentTripStartTime(
                    "${tripTime?.hour ?? 0}:${tripTime?.minute ?? 0}"),
                //  print(tripTime.toString()),
              },
              controller: widget.startTimeLocationTextEditingController,
              decoration: InputDecoration(
                labelText: AppStrings.tripTime.tr(),
                hintText: AppStrings.tripTimeHint.tr(),
                // errorText: (() ?? true) || true
                //     ? null
                //     : AppStrings.fromLocationHint.tr(),
              ),
            ),
            // eliveryTripInputWidget()
          ],
        ),
      ),
    );
  }

  pickLocation(BuildContext context, Function setLocation,
      String locationMassage, String locationMassageHint) {
    // PickedData? pickedDataa;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: OpenStreetMapSearchAndPick(
              //center: LatLong(23, 89),
              buttonColor: ColorManager.primary,
              locationPinIconColor: ColorManager.primary,
              buttonText: locationMassage.tr(),
              hintText: locationMassageHint.tr(),
              locationPinTextStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ColorManager.primary),
              onPicked: (pickedData) {
                print(pickedData.latLong.latitude);
                print(pickedData.latLong.longitude);
                print(pickedData.address);
                //pickedDataa = pickedData;
                setLocation(
                    LatLng(pickedData.latLong.latitude,
                        pickedData.latLong.longitude),
                    pickedData.address['state'] ?? "a7a",
                    pickedData.addressName);

                Navigator.of(context).pop();
              }),
        ),
      ),
    );

    //return pickedDataa;
  }
}

class eliveryTripInputWidget extends StatelessWidget {
  eliveryTripInputWidget({super.key});

  final locationController = Location();
  final googlePlex = const LatLng(31.151897, 31.934281);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: googlePlex, zoom: 13),
        markers: {
          Marker(
              markerId: const MarkerId("a7a"),
              icon: BitmapDescriptor.defaultMarker,
              position: googlePlex)
        },
      ),
    );
  }

  Future<void> fetchLocation() async {
    bool serviceEnabled;
    PermissionStatus premissionGranted;
    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    }
    premissionGranted = await locationController.hasPermission();
    if (premissionGranted == PermissionStatus.denied) {
      premissionGranted = await locationController.requestPermission();
      if (premissionGranted == PermissionStatus.granted) {
        return;
      }
    }
    locationController.onLocationChanged.listen((currentLocation) {});
  }
}

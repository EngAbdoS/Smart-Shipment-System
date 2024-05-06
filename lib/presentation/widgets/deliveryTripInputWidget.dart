import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:location/location.dart';
import 'package:smart_shipment_system/presentation/resources/theme_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/select_week_days.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class DeliveryTripInputWidget extends StatefulWidget {
  DeliveryTripInputWidget({
    super.key,
    required this.addDeliveryTrip,
    required this.setCurrentFromLocationAndGov,
    required this.setCurrentToLocationAndGov,
    required this.setCurrentTripDetailsLocation,
    required this.setCurrentTripStartTime,
    required this.setCurrentTripExpectedDuration,
    required this.setCurrentTripNewDay,
    required this.setCurrentDeliveryIsTripOneTime,
    required this.fromLocationTextEditingController,
    required this.toLocationTextEditingController,
    required this.startTimeLocationTextEditingController,
    required this.expectedDurationTextEditingController,
    required this.tripDetailsTextEditingController,
    required this.tripDaysTextEditingController,
    required this.outputFromLocation,
    required this.outputToLocation,
    required this.outputStartTime,
    required this.outputExpectedDuration,
    required this.outputTripDetails,
    required this.outputCurrentDeliveryIsTripOneTime,
    required this.outputTripDaysList,
    required this.setCurrentTripDay,
    required this.outputIsDeliveryTripValid,
  });

  final Stream<String> outputFromLocation;
  final Stream<String> outputToLocation;
  final Stream<String> outputStartTime;
  final Stream<bool> outputExpectedDuration;
  final Stream<bool> outputTripDetails;
  final Stream<bool> outputCurrentDeliveryIsTripOneTime;
  final Stream<List<String>> outputTripDaysList;
  final Stream<bool> outputIsDeliveryTripValid;

  final TextEditingController fromLocationTextEditingController;
  final TextEditingController toLocationTextEditingController;
  final TextEditingController startTimeLocationTextEditingController;
  final TextEditingController expectedDurationTextEditingController;
  final TextEditingController tripDetailsTextEditingController;
  final TextEditingController tripDaysTextEditingController;

  final Function addDeliveryTrip;
  final Function setCurrentFromLocationAndGov;
  final Function setCurrentToLocationAndGov;
  final Function setCurrentTripDetailsLocation;
  final Function setCurrentTripStartTime;
  final Function setCurrentTripExpectedDuration;
  final Function setCurrentTripNewDay;
  final Function setCurrentTripDay;
  final Function setCurrentDeliveryIsTripOneTime;

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

    widget.setCurrentDeliveryIsTripOneTime(true);
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8 * 0.6),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: StreamBuilder<bool>(
                      stream: widget.outputExpectedDuration,
                      builder: (context, snapshot) {
                        return TextFormField(
                          onChanged: (duration) =>
                              widget.setCurrentTripExpectedDuration(
                                  duration != "" ? int.parse(duration) : 0),
                          keyboardType: TextInputType.number,
                          controller:
                              widget.expectedDurationTextEditingController,
                          decoration: InputDecoration(
                            hintText: AppStrings.tripExDurationHint.tr(),
                            labelText: AppStrings.tripExDuration.tr(),
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.tripExDurationHint.tr(),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  width: 15.sp,
                ),
                Expanded(
                  child: TextFormField(
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
                                timePickerTheme:
                                    TimePickerTheme.of(context).copyWith(
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
                ),
              ],
            ),

            SizedBox(
              height: 15.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.isTripPeriodic,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorManager.black),
                ).tr(),
                StreamBuilder<bool>(
                    stream: widget.outputCurrentDeliveryIsTripOneTime,
                    builder: (context, snapshot) {
                      return Switch(
                          activeColor: ColorManager.primary,
                          inactiveTrackColor:
                              ColorManager.primary.withOpacity(0.05),
                          inactiveThumbColor: ColorManager.gray,
                          value: snapshot.data ?? true,
                          onChanged: (value) => {
                                widget.setCurrentDeliveryIsTripOneTime(value),
                                widget.tripDaysTextEditingController.text = "",
                              });
                    }),
              ],
            ),

            SizedBox(
              height: 15.sp,
            ),
            StreamBuilder<bool>(
                stream: widget.outputCurrentDeliveryIsTripOneTime,
                builder: (context, snapshot) {
                  return ((snapshot.data ?? true)
                      ? dateOfTripInputWidget(
                          context,
                          widget.outputTripDaysList,
                          widget.setCurrentTripDay,
                          widget.tripDaysTextEditingController,
                        ).animate().slideY(
                          begin: -0.5, end: 0, curve: Curves.bounceInOut)
                      : pickTripDaysInputWidget(
                              context,
                              widget.outputTripDaysList,
                              widget.setCurrentTripNewDay)
                          .animate(delay: 300.milliseconds)
                          .slideX(begin: 0.1, end: 0, curve: Curves.easeOut));
                }),
            SizedBox(
              height: 15.sp,
            ),

            Center(
              child: StreamBuilder<bool>(
                  stream: widget.outputIsDeliveryTripValid,
                  builder: (context, snapshot) {
                    return CircularButton(
                      buttonColor: (snapshot.data ?? false)
                          ? ColorManager.primary
                          : ColorManager.primary.withOpacity(0.2),
                      buttonAction: (snapshot.data ?? false)
                          ? () => print("a7a")
                          : () => toastWidget(
                              AppStrings.validateDeliveryTripInputToast),
                      buttonWidget: const Icon(
                        Icons.add,
                        color: ColorManager.black,
                        size: 30,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 15.sp,
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

Widget dateOfTripInputWidget(
  BuildContext context,
  Stream<List<String>> outputTripDaysList,
  Function setCurrentTripDay,
  TextEditingController tripDaysTextEditingController,
) {
  DateTime? pickedDate;
  return StreamBuilder<List<String>>(
      stream: outputTripDaysList,
      builder: (context, snapshot) {
        return TextFormField(
          //  enabled: false,
          readOnly: true,
          onTap: () async {
            pickedDate = await showDatePicker(
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                // initialEntryMode=DatePickerEntryMode.input,
                // barrierColor: ColorManager.primary,
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)));
            setCurrentTripDay((pickedDate != null
                    ? (DateFormat.yMd().format(pickedDate!))
                    : "")
                .toString());

            tripDaysTextEditingController.text =pickedDate!=null?
                "${pickedDate!.year}-${pickedDate!.month }-${pickedDate!.day}":"";
          },

          controller: tripDaysTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.tripDaysHint.tr(),
            labelText: AppStrings.tripDays.tr(),
            errorText: ((snapshot.data?[0] !=""||snapshot.data!=[]) ?? true)
                ? null
                : AppStrings.tripDaysHint.tr(),
          ),
        );
      });
}

Widget pickTripDaysInputWidget(
  BuildContext context,
  Stream<List<String>> outputTripDaysList,
  Function setCurrentTripDay,
) {
  return SelectWeekDays(
    daysFillColor: ColorManager.primary,
    padding: 3.sp,
    daysBorderColor: ColorManager.primary,
    unSelectedDayTextColor: ColorManager.black,
    border: true,
    boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.offWhite,
        border: Border.all(width: 2, color: ColorManager.gray)),
    fontSize: 6.3.sp,
    onSelect: (selectedDays) => {
      setCurrentTripDay(selectedDays),
      print(selectedDays),
    },
    days: [
      DayInWeek(
        AppStrings.saturday.tr(),
        dayKey: AppStrings.saturday.tr(),
      ),
      DayInWeek(
        AppStrings.sunday.tr(),
        dayKey: AppStrings.sunday.tr(),
      ),
      DayInWeek(
        AppStrings.monday.tr(),
        dayKey: AppStrings.monday.tr(),
      ),
      DayInWeek(
        AppStrings.tuesday.tr(),
        dayKey: AppStrings.tuesday.tr(),
      ),
      DayInWeek(
        AppStrings.wednesday.tr(),
        dayKey: AppStrings.wednesday.tr(),
      ),
      DayInWeek(
        AppStrings.thursday.tr(),
        dayKey: AppStrings.thursday.tr(),
      ),
      DayInWeek(
        AppStrings.friday.tr(),
        dayKey: AppStrings.friday.tr(),
      ),
    ],
  );
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

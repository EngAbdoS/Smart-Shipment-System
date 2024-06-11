import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smart_shipment_system/domain/models/deliveryTripModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/theme_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/select_week_days.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

import '../authenticathion/deliveryRegistration/viewModel/deliveryRegisterationViewModel.dart';

class DeliveryTripInputWidget extends StatelessWidget {
  final DeliveryRegistrationViewModel viewModel;

  DeliveryTripInputWidget({
    super.key,
    required this.viewModel,
  });

  final TextEditingController fromLocationTextEditingController =
      TextEditingController();
  final TextEditingController toLocationTextEditingController =
      TextEditingController();
  final TextEditingController startTimeLocationTextEditingController =
      TextEditingController();
  final TextEditingController expectedDurationTextEditingController =
      TextEditingController();
  final TextEditingController tripDetailsTextEditingController =
      TextEditingController();
  final TextEditingController tripDaysTextEditingController =
      TextEditingController();
  TimeOfDay? tripTime;

  DateTime? pickedDate;

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
                  viewModel.setCurrentFromLocationAndGov,
                  fromLocationTextEditingController,
                  AppStrings.locationMassage.tr(),
                  AppStrings.locationMassageHint.tr()),

              controller: fromLocationTextEditingController,
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
                  viewModel.setCurrentToLocationAndGov,
                  toLocationTextEditingController,
                  //  widget.setCurrentToLocationAndGov,
                  AppStrings.locationMassage.tr(),
                  AppStrings.locationMassageHint.tr()),

              controller: toLocationTextEditingController,
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
                stream: viewModel.outputIsCurrentTripDetails,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (tripDetails) =>
                        viewModel.setCurrentTripDetails(tripDetails),
                    keyboardType: TextInputType.text,
                    controller: tripDetailsTextEditingController,
                    decoration: InputDecoration(
                      hintText: AppStrings.tripDetailsHint.tr(),
                      labelText: AppStrings.tripDetails.tr(),
                      errorText: (snapshot.data ?? true) || true
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
                      stream: viewModel.outputCurrentTripExpectedDuration,
                      builder: (context, snapshot) {
                        return TextFormField(
                          onChanged: (duration) =>
                              viewModel.setCurrentTripExpectedDuration(
                                  duration != "" ? int.parse(duration) : 0),
                          keyboardType: TextInputType.number,
                          controller: expectedDurationTextEditingController,
                          decoration: InputDecoration(
                            hintText: AppStrings.tripExDurationHint.tr(),
                            labelText: AppStrings.tripExDuration.tr(),
                            errorText: (snapshot.data ?? true) || true
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
                      viewModel.setCurrentTripStartTime(
                          "${tripTime?.hour ?? 0}:${tripTime?.minute ?? 0}"),
                      startTimeLocationTextEditingController.text =
                          "${tripTime?.hour ?? 0}:${tripTime?.minute ?? 0}",
                      //  print(tripTime.toString()),
                    },
                    controller: startTimeLocationTextEditingController,
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
                    stream: viewModel.outputCurrentDeliveryIsTripOneTime,
                    builder: (context, snapshot) {
                      return Switch(
                          activeColor: ColorManager.primary,
                          inactiveTrackColor:
                              ColorManager.primary.withOpacity(0.05),
                          inactiveThumbColor: ColorManager.gray,
                          value: snapshot.data ?? true,
                          onChanged: (value) => {
                                viewModel
                                    .setCurrentDeliveryIsTripOneTime(value),
                                tripDaysTextEditingController.text = "",
                              });
                    }),
              ],
            ),

            SizedBox(
              height: 15.sp,
            ),
            StreamBuilder<bool>(
                stream: viewModel.outputCurrentDeliveryIsTripOneTime,
                builder: (context, snapshot) {
                  return ((snapshot.data ?? true)
                      ? dateOfTripInputWidget().animate().slideY(
                          begin: -0.5, end: 0, curve: Curves.bounceInOut)
                      : pickTripDaysInputWidget()
                          .animate(delay: 300.milliseconds)
                          .slideX(begin: 0.1, end: 0, curve: Curves.easeOut));
                }),
            SizedBox(
              height: 15.sp,
            ),
            Center(
              child: StreamBuilder<bool>(
                  stream: viewModel.outputIsDeliveryTripValid,
                  builder: (context, snapshot) {
                    return CircularButton(
                      buttonColor: (snapshot.data ?? false)
                          ? ColorManager.primary
                          : ColorManager.primary.withOpacity(0.2),
                      buttonAction: (snapshot.data ?? false)
                          ? () => setDeliveryTrip()
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

  void setDeliveryTrip() {
    viewModel.setNewDeliveryTrip();
    fromLocationTextEditingController.text = "";
    toLocationTextEditingController.text = "";
    startTimeLocationTextEditingController.text = "";
    expectedDurationTextEditingController.text = "";
    tripDetailsTextEditingController.text = "";
    tripDaysTextEditingController.text = "";
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

    //return pickedDataa;
  }

  Widget dateOfTripInputWidget() {
    return StreamBuilder<List<String>>(
        stream: viewModel.outputCurrentTripDays,
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
              viewModel.setCurrentTripDay((pickedDate != null
                      ? (DateFormat.yMd().format(pickedDate!))
                      : "")
                  .toString());

              tripDaysTextEditingController.text = pickedDate != null
                  ? "${pickedDate!.year}-${pickedDate!.month}-${pickedDate!.day}"
                  : "";
            },

            controller: tripDaysTextEditingController,
            decoration: InputDecoration(
              hintText: AppStrings.tripDaysHint.tr(),
              labelText: AppStrings.tripDays.tr(),
              // errorText:
              //     ((snapshot.data?[0] != "" || snapshot.data != []) ?? true)
              //         ? null
              //         : AppStrings.tripDaysHint.tr(),
            ),
          );
        });
  }

  Widget pickTripDaysInputWidget() {
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
        viewModel.setCurrentTripNewDay(selectedDays),
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
}

Widget deliveryAddedTripList(
    BuildContext context,
    Stream<List<DeliveryTripModel>> outputDeliveryTripList,
    Function deleteTrip) {
  return StreamBuilder<List<DeliveryTripModel>>(
      stream: outputDeliveryTripList,
      builder: (context, snapshot) {
        return Container(
          // height: 200,
          padding: EdgeInsets.only(bottom: 25.sp),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => deliveryTripWidget(
                    context, snapshot.data![index], index, deleteTrip)
                .animate()
                .slideY(duration: 300.milliseconds, curve: Curves.bounceInOut),
            itemCount: snapshot.data?.length ?? 0,
          ).animate().shake(curve: Curves.bounceInOut),
        );
      });
}

Widget deliveryTripWidget(BuildContext context, DeliveryTripModel deliveryTrip,
    int index, Function deleteTrip) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8 * 0.6, vertical: AppPadding.p8),
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: ColorManager.primary.withOpacity(0.1), blurRadius: 40)
      ], color: ColorManager.offWhite, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: tripTextWidget(
                      context,
                      (deliveryTrip.isOneTime ?? true)
                          ? "${AppStrings.tripDays.tr()}: ${deliveryTrip.tripDay}"
                          : "${AppStrings.tripDays.tr()}: ${deliveryTrip.tripWeekDays}")),
              IconButton(
                  onPressed: () => deleteTrip(index),
                  icon: const Icon(
                    Icons.delete,
                    color: ColorManager.primary,
                  ))
            ],
          ),
          tripTextWidget(
              context, "${AppStrings.tripTime.tr()}: ${deliveryTrip.tripTime}"),
          SizedBox(
            height: 14.sp,
          ),
          tripTextWidget(context,
              "${AppStrings.fromLocation.tr()}: ${deliveryTrip.fromAddressName}"),
          SizedBox(
            height: 14.sp,
          ),
          tripTextWidget(context,
              "${AppStrings.toLocation.tr()}: ${deliveryTrip.toAddressName}"),
          SizedBox(
            height: 14.sp,
          ),
          tripTextWidget(context,
              "${AppStrings.tripDetails.tr()}: ${deliveryTrip.tripDetails}"),
          SizedBox(
            height: 14.sp,
          ),
        ],
      ),
    ),
  );
}

Widget tripTextWidget(BuildContext context, String text) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p8, vertical: AppPadding.p8),
    decoration: BoxDecoration(
      border: Border.all(color: ColorManager.lightGray),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: Theme.of(context).textTheme.titleSmall,
    ),
  );
}
//
// class eliveryTripInputWidget extends StatelessWidget {
//   eliveryTripInputWidget({super.key});
//
//   final locationController = Location();
//   final googlePlex = const LatLng(31.151897, 31.934281);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       width: double.maxFinite,
//       child: GoogleMap(
//         initialCameraPosition: CameraPosition(target: googlePlex, zoom: 13),
//         markers: {
//           Marker(
//               markerId: const MarkerId("a7a"),
//               icon: BitmapDescriptor.defaultMarker,
//               position: googlePlex)
//         },
//       ),
//     );
//   }
//
//   Future<void> fetchLocation() async {
//     bool serviceEnabled;
//     PermissionStatus premissionGranted;
//     serviceEnabled = await locationController.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await locationController.requestService();
//     }
//     premissionGranted = await locationController.hasPermission();
//     if (premissionGranted == PermissionStatus.denied) {
//       premissionGranted = await locationController.requestPermission();
//       if (premissionGranted == PermissionStatus.granted) {
//         return;
//       }
//     }
//     locationController.onLocationChanged.listen((currentLocation) {});
//   }
// }

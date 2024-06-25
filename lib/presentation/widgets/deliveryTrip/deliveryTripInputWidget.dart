import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/theme_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/inputLocationWidget.dart';
import 'package:smart_shipment_system/presentation/widgets/select_week_days.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class DeliveryTripInputWidget extends StatelessWidget {
  final dynamic viewModel;

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
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              height: 15.sp,
            ),
            inputLocationWidget(
                context,
                viewModel.setCurrentFromLocationAndGov,
                AppStrings.fromLocation,
                AppStrings.locationMassage,
                AppStrings.fromLocationHint),
            SizedBox(
              height: 15.sp,
            ),

            inputLocationWidget(
                context,
                viewModel.setCurrentToLocationAndGov,
                AppStrings.toLocation,
                AppStrings.locationMassage,
                AppStrings.toLocationHint),
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



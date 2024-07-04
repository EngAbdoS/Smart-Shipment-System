import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget dateOfBirthInputWidget(
  BuildContext context,
  Stream<bool> outputIsDateOfBirthValid,
  Function setDateOfBirth,
) {
  TextEditingController dateOfBirthTextEditingController =
      TextEditingController();
  DateTime? pickedDate;
  return StreamBuilder<bool>(
      stream: outputIsDateOfBirthValid,
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
                firstDate: DateTime(1950),
                lastDate: DateTime(2100));
            setDateOfBirth(pickedDate ?? DateTime(0));
            dateOfBirthTextEditingController.text =
                "${pickedDate?.year ?? "0"}-${pickedDate?.month ?? "0"}-${pickedDate?.day ?? "0"}";
          },

          controller: dateOfBirthTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.dateBirthError.tr(),
            labelText: AppStrings.dateBirth.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.dateBirthError.tr(),
          ),
        );
      });
}

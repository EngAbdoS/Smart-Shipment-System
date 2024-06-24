import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget shipmentWeightInputWidget(
  Stream<bool> outputWeightValid,
  Function setWeight,
) {
  TextEditingController weightTextEditingController = TextEditingController();
  return StreamBuilder<bool>(
      stream: outputWeightValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (weight) => setWeight(weight),
          keyboardType: TextInputType.number,
          controller: weightTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.shipment_weight_kg.tr(),
            labelText: AppStrings.shipment_weight.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.input_valid_weight.tr(),
          ),
        );
      });
}

Widget shipmentQuantityInputWidget(
    Stream<bool> outputShipmentQuantityValid,
    Function setShipmentQuantity,
    ) {
  TextEditingController shipmentQuantityTextEditingController =
  TextEditingController();

  return StreamBuilder<bool>(
      stream: outputShipmentQuantityValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (quantity) => setShipmentQuantity(quantity),
          keyboardType: TextInputType.number,
          controller: shipmentQuantityTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.shipment_quantity_hint.tr(),
            labelText: AppStrings.shipment_quantity.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.shipment_quantity_hint.tr(),
          ),
        );
      });
}
Widget shipmentTypeInputWidget(
  Stream<bool> outputShipmentTypeValid,
  Function setShipmentType,
) {
  TextEditingController shipmentTypeTextEditingController =
      TextEditingController();

  return StreamBuilder<bool>(
      stream: outputShipmentTypeValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (weight) => setShipmentType(weight),
          keyboardType: TextInputType.multiline,
          controller: shipmentTypeTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.product_type.tr(),
            labelText: AppStrings.shipment_type.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.input_valid_details.tr(),
          ),
        );
      });
}

Widget recipientNameInputWidget(
  Stream<bool> outputIsFirstNameValid,
  Function setName,
) {
  TextEditingController nameTextEditingController = TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsFirstNameValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (name) => setName(name),
          //  _viewModel.setFirstName(firstName),
          keyboardType: TextInputType.name,
          controller: nameTextEditingController,
          //_firstNameController,
          decoration: InputDecoration(
            // label: Text(AppStrings.username.tr()),
            hintText: AppStrings.recipient_name_hint.tr(),
            labelText: AppStrings.recipient_name.tr(),
            errorText:
                (snapshot.data ?? true) ? null : AppStrings.nameHint.tr(),
          ),
        );
      });
}

Widget descriptionInputWidget(
  Stream<bool> outputIsDescriptionValid,
  Function setShipmentDescription,
) {
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsDescriptionValid,
      //_viewModel.outputIsFirstNameValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (description) => setShipmentDescription(description),
          keyboardType: TextInputType.name,
          controller: descriptionTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.shipment_description_hint.tr(),
            labelText: AppStrings.shipment_description.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.shipment_description_hint.tr(),
          ),
        );
      });
}

Widget recipientPhoneNumberInputWidget(
  Stream<bool> outputIsPhoneNumberValid,
  Function setPhoneNumber,
) {
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  return StreamBuilder<bool>(
      stream: outputIsPhoneNumberValid,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: (phoneNumber) => setPhoneNumber(phoneNumber),
          keyboardType: TextInputType.phone,
          controller: phoneNumberTextEditingController,
          decoration: InputDecoration(
            hintText: AppStrings.recipient_phone_hint.tr(),
            labelText: AppStrings.recipient_phone.tr(),
            errorText: (snapshot.data ?? true)
                ? null
                : AppStrings.phoneNumberError.tr(),
          ),
        );
      });
}

Widget locationWidget() => const Column(
      children: [
        Icon(
          Icons.my_location,
          color: ColorManager.primary,
        ),
        SizedBox(
          height: 42,
          child: DottedLine(
            direction: Axis.vertical,
            dashColor: ColorManager.primary,
            dashGapLength: 2,
            dashLength: 2,
            dashGapRadius: 5,
          ),
        ),
        Icon(
          Icons.location_on_outlined,
          color: ColorManager.primary,
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget deliveryVehicleLicensePictureInputWidget(
  BuildContext contextt,
  Stream<File> outputDeliveryVehicleLicensePicture,
  Stream<bool> outputIsDeliveryVehicleLicensePictureValid,
  Function setDeliveryVehicleLicensePicture,
) {
  final ImagePicker _imagePicker = ImagePicker();
  return Column(
    children: [
      StreamBuilder<File>(
          stream: outputDeliveryVehicleLicensePicture,
          builder: (context, fileSnapshot) {
            return StreamBuilder<bool>(
                stream: outputIsDeliveryVehicleLicensePictureValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    readOnly: true,
                    minLines: 3,
                    maxLines: 5,
                    onTap: () async {
                      showModalBottomSheet(
                          context: contextt,
                          builder: (BuildContext context) {
                            return SafeArea(
                                child: Wrap(
                              children: [
                                ListTile(
                                  trailing: const Icon(Icons.arrow_forward),
                                  leading: const Icon(Icons.photo),
                                  title:
                                      const Text(AppStrings.photoGallery).tr(),
                                  onTap: () async {
                                    var image = await _imagePicker.pickImage(
                                        source: ImageSource.gallery);
                                    setDeliveryVehicleLicensePicture(
                                        File(image?.path ?? ""));
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  trailing: const Icon(Icons.arrow_forward),
                                  leading:
                                      const Icon(Icons.camera_alt_outlined),
                                  title:
                                      const Text(AppStrings.photoCamera).tr(),
                                  onTap: () async {
                                    var image = await _imagePicker.pickImage(
                                        source: ImageSource.camera);
                                    setDeliveryVehicleLicensePicture(
                                        File(image?.path ?? ""));
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ));
                          });
                    },
                    decoration: InputDecoration(
                      hintText: (snapshot.data ?? true)
                          ? fileSnapshot.data?.path
                          : AppStrings.vehicleLicenseHint.tr(),
                      hintMaxLines: 1,
                      labelText: AppStrings.vehicleLicense.tr(),
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.vehicleLicenseHint.tr(),
                    ),
                  );
                });
          }),
      SizedBox(
        height: 30.sp,
      ),
      Text(
        AppStrings.noVehicleHint,
        style: Theme.of(contextt)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorManager.error.withOpacity(0.5), fontSize: 12),
      ).tr(),
    ],
  );
}

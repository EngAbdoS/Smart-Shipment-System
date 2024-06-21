import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

pickImage(BuildContext contextt, Function setImage) {
  final ImagePicker _imagePicker = ImagePicker();

  return showModalBottomSheet(
      context: contextt,
      builder: (BuildContext context) {
        return SafeArea(
            child: Wrap(
          children: [
            ListTile(
              trailing: const Icon(Icons.arrow_forward),
              leading: const Icon(Icons.photo),
              title: const Text(AppStrings.photoGallery).tr(),
              onTap: () async {
                var image =
                    await _imagePicker.pickImage(source: ImageSource.gallery);

                setImage(image?.path ?? "");
                // setDeliveryConfirmationPicture(
                //     File(image?.path ?? ""));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_forward),
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text(AppStrings.photoCamera).tr(),
              onTap: () async {
                var image =
                    await _imagePicker.pickImage(source: ImageSource.camera);
                setImage(image?.path ?? "");

                // setDeliveryConfirmationPicture(
                //     File(image?.path ?? ""));
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
      });
}

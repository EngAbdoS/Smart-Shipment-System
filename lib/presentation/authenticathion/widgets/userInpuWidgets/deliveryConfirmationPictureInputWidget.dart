import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

Widget deliveryConfirmationPictureInputWidget(
  BuildContext contextt,
  Stream<File> outputDeliveryConfirmationPicture,
  Stream<bool> outputIsDeliveryConfirmationPictureValid,
  Function setDeliveryConfirmationPicture,
) {
  final ImagePicker imagePicker = ImagePicker();
  return StreamBuilder<File>(
      stream: outputDeliveryConfirmationPicture,
      builder: (context, fileSnapshot) {
        return StreamBuilder<bool>(
            stream: outputIsDeliveryConfirmationPictureValid,
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
                              title: const Text(AppStrings.photoGallery).tr(),
                              onTap: () async {
                                var image = await imagePicker.pickImage(
                                    source: ImageSource.gallery);
                                setDeliveryConfirmationPicture(
                                    File(image?.path ?? ""));
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              trailing: const Icon(Icons.arrow_forward),
                              leading: const Icon(Icons.camera_alt_outlined),
                              title: const Text(AppStrings.photoCamera).tr(),
                              onTap: () async {
                                var image = await imagePicker.pickImage(
                                    source: ImageSource.camera);
                                setDeliveryConfirmationPicture(
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
                      : AppStrings.confirmationPictureHint.tr(),
                  hintMaxLines: 1,
                  labelText: AppStrings.confirmationPicture.tr(),
                  errorText: (snapshot.data ?? true)
                      ? null
                      : AppStrings.confirmationPictureHint.tr(),
                ),
              );
            });
      });
}

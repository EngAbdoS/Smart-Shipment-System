import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/optWidget/pickImage.dart';

Widget userEditProfileImage(BuildContext context,
    Function setImage,
    Stream<String?> outputProfileImageStream,
    Stream<bool?> outputIsProfileImageEditingStream) {
  final ImagePicker _imagePicker = ImagePicker();

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30.h),
    child: GestureDetector(
      onTap:()=> pickImage(context,setImage),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          StreamBuilder<String?>(
              stream: outputProfileImageStream,
              builder: (context, snapshot) {
                return StreamBuilder<bool?>(
                    stream: outputIsProfileImageEditingStream,
                    builder: (context, editingSnapshot) {
                      return Container(
                        height: 200.h,
                        width: 200.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (editingSnapshot.data ?? false)
                                    ? Image.file(
                                       File( snapshot.data ?? ""),
                                        fit: BoxFit.cover,
                                      ).image
                                    : Image.network(
                                        snapshot.data ?? "",
                                        fit: BoxFit.fill,
                                      ).image)),
                      );
                    });
              }),
          Padding(
            padding: EdgeInsets.all(5.h),
            child: Container(
              width: 50.h,
              height: 50.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.gray.withOpacity(0.5)),
              child: Icon(
                Icons.imagesearch_roller_outlined,
                color: ColorManager.primary,
                size: 30.h,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

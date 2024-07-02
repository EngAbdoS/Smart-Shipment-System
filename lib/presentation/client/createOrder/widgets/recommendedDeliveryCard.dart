import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

Widget recommendedDeliveryCard(
    BuildContext context, RecommendedDeliveryEntity delivery) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: ColorManager.white,
        boxShadow: const [
          BoxShadow(
            color: ColorManager.shadowColor,
            offset: Offset(2, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileCirclerImage(
                imageUrl: delivery.profileImage,
                size: 50.h,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    delivery.userName,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(delivery.vehicleType,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorManager.primary)),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Icon(Icons.location_on_outlined,
                      color: ColorManager.primary),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(delivery.day,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 10)),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(delivery.time,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 10)),
                ],
              ),
            ],
          ),
          SizedBox(
              height: 60,
              child: OverflowBox(
                  child: Lottie.asset(JsonAssets.mapCard,
                      height: 60, fit: BoxFit.fitHeight))),

          //  SizedBox(height: 10.h,),
        delivery.role!=AppConstants.deliveryRoleInternal?  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(Icons.share_location_outlined,
                      color: ColorManager.primary),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(delivery.startState,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 10)),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.my_location_outlined,
                      color: ColorManager.primary),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(delivery.endState,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 10)),
                ],
              ),
            ],
          ):Row(
          mainAxisAlignment: MainAxisAlignment.start,
children: [

  const Icon(Icons.edit_location_alt_outlined,
      color: ColorManager.primary),
  SizedBox(width: 10.w,),
  Text(delivery.currentGovState,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontSize: 10)),

],



        )
        ],
      ),
    ),
  );
}

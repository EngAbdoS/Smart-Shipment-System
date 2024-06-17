import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';
import 'package:lottie/lottie.dart';
class ClientHomeView extends StatelessWidget {
  ClientHomeView({super.key});

  final ClientHomeViewModel _viewModel = instance<ClientHomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 491.w,
          collapsedHeight: 100,
          stretch: true,
          snap: false,
          floating: false,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          backgroundColor: ColorManager.primary,
          title: Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                StudentProfileCirclerImage(
                  imageUrl: "_viewModel.userModel!.email",
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.goodMorning,
                      style: Theme.of(context).textTheme.titleSmall,
                    ).tr(),
                    Text(
                      _viewModel.userModel.userName,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: ColorManager.black),
                    ).tr(),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.circle_notifications_outlined,
                    size: 53.h,
                    color: ColorManager.black,
                  ),
                ),
              ],
            ),
          ),
          toolbarHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 160),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.track_your_shipment,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20),
                    ).tr(),
                    Text(
                      AppStrings.track_your_shipment_hint,
                      style: Theme.of(context).textTheme.titleSmall,
                    ).tr(),
                    shipmentSearch(),

                    Align(                        alignment: Alignment.bottomCenter,

                      child: ClipRRect(

                          borderRadius: BorderRadius.circular(5),


                        child: Lottie.asset(
                          JsonAssets.clientMain,
                        alignment: Alignment.bottomCenter,
                          width: double.maxFinite,
                          height: 300.h,
                          fit: BoxFit.fill,

                        ),
                      ),
                    )
                    // SvgPicture.asset(SVGAssets.onBoardingPic1,
                    //     height: 170.h,
                    //     fit: BoxFit.fitHeight,
                    //     allowDrawingOutsideViewBox: true,excludeFromSemantics: true,)
                  ],
                ),
              ),
            ),
            stretchModes: const <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 800,
                width: double.maxFinite,
                color: Colors.lightBlue.withOpacity(0.1),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Colors.red,
                    height: 700,
                  ),
                ),
              ),
            )
          ]),
        ),
      ],
    );
  }
}

Widget shipmentSearch() {
  TextEditingController shipmentTextEditing = TextEditingController();

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
    child: Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(color: ColorManager.primary, width: 1),
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray.withOpacity(0.25),
            blurRadius: 16,
            offset: Offset(2, 8),
          )
        ],
      ),
      child: TextFormField(
        onChanged: (password) => {},
        keyboardType: TextInputType.number,
        controller: shipmentTextEditing,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_sharp,
              weight: 100,
              color: ColorManager.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.inputField, width: 0),
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primary, width: 0),
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            hintText: AppStrings.shipment_number.tr(),
            //  labelText: AppStrings.shipment_number.tr(),
            //errorText:  AppStrings.passwordInvalid.tr(),
            errorMaxLines: 2),
      ),
    ),
  );
}

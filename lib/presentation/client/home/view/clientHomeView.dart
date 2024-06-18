import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';
import 'package:lottie/lottie.dart';

class ClientHomeView extends StatefulWidget {
  const ClientHomeView({super.key});

  @override
  State<ClientHomeView> createState() => _ClientHomeViewState();
}

class _ClientHomeViewState extends State<ClientHomeView> {
  final ClientHomeViewModel _viewModel = instance<ClientHomeViewModel>();

  @override
  void initState() {
    _viewModel.startHomeView(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        buildSliverAppBar(context),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Align(
                alignment: Alignment.topCenter,
                child: activeShipmentList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget activeShipmentList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.active_shipments,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: ColorManager.black,
                      fontSize: 14,
                    ),
              ).tr(),
              TextButton(
                onPressed: () => _viewModel.seeMore(),
                child: Text(
                  AppStrings.see_more,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.black),
                ).tr(),
              )
            ],
          ),
        ),
        Container(
          color: ColorManager.offWhite,
          child: StreamBuilder<int?>(
              stream: _viewModel.outputActiveShipmentList,
              builder: (context, snapshot) {
                //print(snapshot.data);
                return(snapshot.hasData&&snapshot.data!>0)? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data ?? 0,
                    itemBuilder: (context, index) {
                      return shipmentCard(
                          context, _viewModel.activeShipmentList[index]);
                    }):Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SvgPicture.asset(SVGAssets.noData,height: 200,),
                    );
              }),
        ),
        SizedBox(height: 60,)
      ],
    );
  }

  Widget shipmentCard(BuildContext context, ShipmentModel shipment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.primary.withOpacity(0.15),
              blurRadius: 25,
              offset: const Offset(2, 8),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(shipment.id,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 14))
                        .tr(),
                    Text(shipment.date,
                            style: Theme.of(context).textTheme.titleSmall)
                        .tr(),
                  ],
                ),
                Container(
                  height: 50.h,
                  width: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ColorManager.primary,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.black.withOpacity(0.15),
                        blurRadius: 25,
                        offset: const Offset(2, 8),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    shipment.endLocation,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: 491.w,
      collapsedHeight: 100,
      stretch: true,
      snap: true,
      floating: true,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
      backgroundColor: ColorManager.primary,
      title: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
             StudentProfileCirclerImage(
              imageUrl: _viewModel.userHomeData.email,
               navigate:()=>_viewModel.changeWidget(context, 3),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStrings.goodMorning,
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                Text(
                  _viewModel.userHomeData.userName,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: ColorManager.black, fontSize: 17),
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
          decoration:  BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(35)
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(100),
            //   bottomRight: Radius.circular(100),
           // ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 160),
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

                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Lottie.asset(
                      JsonAssets.ch,
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
            color: ColorManager.black.withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(2, 8),
          )
        ],
      ),
      child: TextFormField(
        onChanged: (password) => {},
        keyboardType: TextInputType.number,
        controller: shipmentTextEditing,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search_sharp,
              weight: 100,
              color: ColorManager.black,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.inputField, width: 0),
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/presentation/client/widgets/shipmentSearch.dart';
import '../../widgets/shipmentList.dart';

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
                child: shipmentList(
                    context: context,
                    viewModel: _viewModel,
                    isActiveShipmentList: true),
              ),
            ],
          ),
        ),
      ],
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
              navigate: () => _viewModel.changeWidget(context, 3),
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
          decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(35)),
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

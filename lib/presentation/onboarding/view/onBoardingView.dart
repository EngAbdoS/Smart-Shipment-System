import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/cirular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});

  static final List<String> onBoardingTitles = [
    AppStrings.onBoardingTitle1,
    AppStrings.onBoardingTitle2,
    AppStrings.onBoardingTitle3,
  ];
  static final List<String> onBoardingDetails = [
    AppStrings.onBoardingSubDesc1,
    AppStrings.onBoardingSubDesc2,
    AppStrings.onBoardingSubDesc3,
  ];
  static final List<String> onBoardingBKs = [
    SVGAssets.onBoardingBK1,
    SVGAssets.onBoardingBK2,
    SVGAssets.onBoardingBK3,
  ];
  static final List<String> onBoardingPics = [
    JsonAssets.a,
    JsonAssets.trac,
    JsonAssets.exDel,
  ];
  final onBoardingPageController = PageController(
      // viewportFraction: 0.8, keepPage: true

      );

  _nextPage() {
    print("next");
    if (onBoardingPageController.hasClients) {
      onBoardingPageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton: floatingWidgets(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Align(
                alignment: Alignment.topRight,
                child: SkipButton()),
            SizedBox(
              height: 715,
              child: PageView.builder(
                // physics: NeverScrollableScrollPhysics()
                allowImplicitScrolling: true,
                clipBehavior: Clip.antiAlias,
                //  allowImplicitScrolling: true,
                controller: onBoardingPageController,
                itemCount: onBoardingTitles.length,
                itemBuilder: (_, index) {
                  var x = MediaQuery.of(context).size.width;
                  return onBoardingWidget(context, index, x);
                },
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: dotsIndicatorWidget())
          ],
        ),
      ),
    );
  }

  Widget floatingWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align(
          alignment: Alignment.topRight,
          child: SkipButton(),
        ),
        const Spacer(),
        Align(alignment: Alignment.bottomCenter, child: dotsIndicatorWidget()),
      ],
    );
  }

  Widget dotsIndicatorWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p20 * 4.5,top: AppPadding.p20*3.5),
      child: SmoothPageIndicator(
        controller: onBoardingPageController,
        count: onBoardingTitles.length,
        effect: const ExpandingDotsEffect(
          activeDotColor: ColorManager.primary,
          dotColor: ColorManager.black,
          dotHeight: AppSize.s14,
          dotWidth: AppSize.s14,

          // type:ExpandingDotsEffect(),
        ),
      ),
    );
  }

  Widget onBoardingWidget(BuildContext context, int index, double width) {
    return Column(
      children: [
        Container(
          padding: index == 0
              ? const EdgeInsets.only(left: AppPadding.p20)
              : index == 2
                  ? const EdgeInsets.only(right: AppPadding.p20,top: AppPadding.p20*.5)
                  : EdgeInsets.zero,
          child: Stack(
            children: [
              SvgPicture.asset(
                 color: ColorManager.primary,

                onBoardingBKs[index],

                width: index == 0 ? width:index==2?width-20: width + 20,
              ),
              Container(
                  padding: const EdgeInsets.only(right: AppPadding.p20),
                  height: 280,
                  width: 280,
                  child: Lottie.asset(onBoardingPics[index],
                      fit: BoxFit.cover, alignment: Alignment.topLeft))
            ],
          ),
        ),
        Text(
          onBoardingTitles[index],
          style: Theme.of(context).textTheme.titleMedium,
        ).tr(),
        const SizedBox(
          height: AppSize.s14 * 2,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppPadding.p20 * 2.5),
          child: Text(
            onBoardingDetails[index],
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
        ),
        const SizedBox(
          height: AppSize.s14 * 2,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppPadding.p20 * 2.5),
          child: index != 2
              ? CircularButton(
                  buttonAction: _nextPage,
                  buttonWidget: SvgPicture.asset(
                    IconAssets.arrowRight,
                    color: ColorManager.black,
                  ))
              : SizedBox(
                  width: WidgetsValues.regularButtonWidthMedium,
                  height: WidgetsValues.regularButtonHeight,
                  child: RegularButton(
                    buttonAction: () => GoRouter.of(context)
                        .pushReplacement(Routes.authViewRoute),
                    buttonWidget: Text(
                      AppStrings.startShipping,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr(),
                  ),
                ),
        ),

        //button
      ],
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: AppPadding.p22, top: AppPadding.p22 * 3),
      child: TextButton(
          onPressed: () =>
              GoRouter.of(context).pushReplacement(Routes.authViewRoute),
          child: Text(
            AppStrings.skip,
            style: Theme.of(context).textTheme.bodySmall,
          ).tr()),
    );
    ;
  }
}

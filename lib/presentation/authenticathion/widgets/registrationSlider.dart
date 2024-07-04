import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

class RegistrationSlider extends StatelessWidget {
  const RegistrationSlider({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pageNumber(context, 1),
          const SizedBox(
            width: 4,
          ),
          buildDivider(2),
          const SizedBox(
            width: 4,
          ),
          pageNumber(context, 2),
          const SizedBox(
            width: 4,
          ),
          buildDivider(3),
          const SizedBox(
            width: 4,
          ),
          pageNumber(context, 3),
        ],
      ),
    ).animate().slideX(begin: 1, end: 0.0, curve: Curves.easeOut);
  }

  Widget buildDivider(int stateIndex) => Expanded(
        child: Divider(
          height: 6.sp,
          thickness: 6,
          color: pageIndex >= stateIndex
              ? ColorManager.primary
              : ColorManager.gray,
        ),
      );

  Container pageNumber(BuildContext context, int stateIndex) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          color: pageIndex >= stateIndex
              ? ColorManager.primary
              : ColorManager.noColor,
          shape: BoxShape.circle,
          border: pageIndex >= stateIndex
              ? Border.all(
                  width: 0,
                  color: ColorManager.noColor,
                )
              : Border.all(
                  width: 1,
                  color: ColorManager.gray,
                )),
      child: Center(
        child: Text(
          stateIndex.toString(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: pageIndex >= stateIndex
                    ? ColorManager.black
                    : ColorManager.gray,
              ),
        ),
      ),
    );
  }
}

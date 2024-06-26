import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

ratingWidget(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        AppStrings.rate,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: ColorManager.primary),
      ).tr(),
      content: AnimatedRatingStars(
        initialRating: 3.5,
        minRating: 0.0,
        maxRating: 5.0,
        filledColor: Colors.amber,
        emptyColor: Colors.grey,
        filledIcon: Icons.star,
        halfFilledIcon: Icons.star_half,
        emptyIcon: Icons.star_border,
        onChanged: (double rating) {
          // Handle the rating change here
          print('Rating: $rating');
        },
        displayRatingValue: true,
        interactiveTooltips: true,
        customFilledIcon: Icons.star,
        customHalfFilledIcon: Icons.star_half,
        customEmptyIcon: Icons.star_border,
        starSize: 30.0,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        readOnly: false,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text(AppStrings.ok).tr(),
        ),
      ],
    ),
  );
}

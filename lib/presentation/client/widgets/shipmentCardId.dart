import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

Widget shipmentCardId(BuildContext context, String id) {
  return Row(
    children: [
      Text('# ',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: ColorManager.primary, fontSize: 18)),
      SelectableText(
        '${id}',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),
      ),
    ],
  );
}

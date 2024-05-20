import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

 testState(BuildContext context)
{
  context.loaderOverlay.visible?context.loaderOverlay.hide():null;

  context.loaderOverlay.show(widgetBuilder: (p) {
    return Stack(
      children: [
        Opacity(
          opacity: .5,
          child: Container(
            color: Colors.black,
            //child: Center(child: Text("a7aaaaaaaaaaaa")),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () => context.loaderOverlay.hide(),
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
              //child: Center(child: Text("a7aaaaaaaaaaaa")),
            ),
          ),
        )
      ],
    );
  });

}
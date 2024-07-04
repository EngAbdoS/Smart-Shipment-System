import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

hideState({required BuildContext context}) {

  context.loaderOverlay.visible?context.loaderOverlay.hide():null;



}
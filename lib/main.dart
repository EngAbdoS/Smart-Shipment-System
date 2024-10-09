import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_shipment_system/.env.dart';
import 'package:smart_shipment_system/app/App.dart';
import 'package:smart_shipment_system/firebase_options.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';
import 'app/dependancy_injection.dart';
import 'package:device_info_plus/device_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  if (!androidInfo.isPhysicalDevice) {
    print("not a physical device");
    toastWidget("not a physical device");
    return;
  }
  Stripe.publishableKey = StripePublishableKey;
  await Stripe.instance.applySettings();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  await initAppModule();
  runApp(
    EasyLocalization(
      startLocale: ARABIC_LOCAL,
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATION,
      child: Phoenix(
        child: const MyApp(),
      ),
    ),
  );
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/resources/language_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: ScreenUtilInit(
        designSize: AppConstants.appDesignSize,
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: getRoute,
          initialRoute: Routes.splashRoute,
          theme: context.locale == ARABIC_LOCAL
              ? getArabicAppTheme()
              : getAppTheme(),
        ),
      ),
    );
  }
}

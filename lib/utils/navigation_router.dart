import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_task/_lib.dart';

BuildContext context = Get.context!;
Route<dynamic> generateRoute(RouteSettings? settings) {
  switch (settings!.name) {
    case splashScreenRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: SplashScreen(),
      );

    case homeScreenRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: HomeScreen(),
      );

    case suggestedLunchScreenRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: Container(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow!);
}

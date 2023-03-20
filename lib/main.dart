import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_task/core/services/navigation_service.dart';
import 'package:tech_task/core/services/snackbar_services.dart';
import 'package:tech_task/utils/constants/theme.dart';
import '_lib.dart';

void main() async {
  setupServices();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ProviderScope(child: Consumer(builder: (context, watch, _) {
    final vm = watch.watch(themeVm);
    return MyApp(
      theme: vm.themeMode,
    );
  })));
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  ThemeMode? theme;
  MyApp({Key? key, this.theme}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
    return DismissableKeyboardFeature(
      child: ScreenUtilInit(
          designSize: const Size(398, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appTitle,
              builder: (context, child) => Navigator(
                key: locator<ProgressService>().progressNavigationKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) {
                    return ProgressManager(child: child!);
                  },
                ),
              ),
              scaffoldMessengerKey:
                  locator<SnackBarService>().scaffoldMessengerKey,
              navigatorKey: locator<NavigationService>().navigationKey,
              theme: AppTheme.lightTheme,
              home: const SplashScreen(),
              onGenerateRoute: generateRoute,
            );
          }),
    );
  }
}

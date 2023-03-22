import 'package:flutter/material.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/utils/mixins/ui_tool_mixin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with UIToolMixin {
  gotoHome() async {
    await delaySession().then(
        (value) => navigationService.navigateReplacementTo(homeScreenRoute));
  }

  @override
  void initState() {
    super.initState();
    gotoHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: CustomText(
        AppStrings.appTitle,
        textType: TextType.headerText,
        color: AppColors.white,
      )),
    );
  }
}

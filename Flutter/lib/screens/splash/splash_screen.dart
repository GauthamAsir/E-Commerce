import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/splash/components/splash_body.dart';
import 'package:shop_app/screens/splash/splash_controller.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<SplashController>();

  @override
  void initState() {
    if (controller.loggedIn != null) {
      if (controller.loggedIn!.value) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.toNamed(HomeScreen.routeName);
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(() => AnimatedSwitcher(
            duration: kDefaultAnimDuration,
            child: controller.loggedIn == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.loggedIn!.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SplashBody(),
          )),
    );
  }
}

import 'package:get/get.dart';
import 'package:shop_app/screens/splash/splash_controller.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}

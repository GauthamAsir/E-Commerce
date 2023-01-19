import 'package:get/get.dart';
import 'package:shop_app/screens/auth/auth_controller.dart';

class AuthControllerBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}

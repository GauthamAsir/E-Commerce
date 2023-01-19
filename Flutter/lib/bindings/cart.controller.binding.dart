import 'package:get/get.dart';
import 'package:shop_app/screens/cart/cart_controller.dart';

class CartControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}

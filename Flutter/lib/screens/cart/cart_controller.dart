import 'dart:math';

import 'package:get/get.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/providers/product_provider.dart';

class CartController extends GetxController {
  RxList<Cart> demoCarts = RxList();

  final _random = new Random();

  ProductProvider productProvider = ProductProvider();

  @override
  void onInit() {
    fetchCartItems();
    super.onInit();
  }

  Future<void> fetchCartItems() async {
    var l = await productProvider.getAllProducts();
    demoCarts.clear();
    demoCarts.addAll(l
        .map((e) => Cart(product: e, numOfItem: randomBetween(1, 5)))
        .toList());
  }

  int randomBetween(int min, int max) => min + _random.nextInt(max - min);
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/screens/cart/cart_controller.dart';

import 'components/cart_body.dart';
import 'components/check_out_card.dart';

class CartScreen extends GetView<CartController> {
  static String routeName = "/cart";

  Widget build(BuildContext context) {
    controller.fetchCartItems();
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartBody(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Obx(() => Text(
                "${controller.demoCarts.length} items",
                style: Theme.of(context).textTheme.caption,
              )),
        ],
      ),
    );
  }
}

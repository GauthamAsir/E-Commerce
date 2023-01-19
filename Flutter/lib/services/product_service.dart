import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/utils/constants.dart';

class ProductService extends GetxService {
  List<Product> productsList = [];

  // @override
  // void onInit() async {
  //   await fetchAllProducts();
  //   super.onInit();
  // }

  Future<ProductService> init() async {
    await fetchAllProducts();
    return this;
  }

  Future<void> fetchAllProducts() async {
    var response =
        await http.get(getUrl(['Product'])).timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      List d = jsonDecode(jsonDecode(response.body));
      List<Product> products = d.map((e) => Product.fromJson(e)).toList();
      productsList.clear();
      productsList.addAll(products);
      return;
    }
    if (kDebugMode) {
      print(response.body);
    }
  }
}

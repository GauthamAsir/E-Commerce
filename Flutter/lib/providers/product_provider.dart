import 'package:get/get.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/services/product_service.dart';

class ProductProvider {
  ProductService productService = Get.find<ProductService>();

  Future<List<Product>> getAllProducts() async {
    if (productService.productsList.isEmpty) {
      await productService.fetchAllProducts();
    }
    // print(productService.productsList);
    return productService.productsList;
  }
}

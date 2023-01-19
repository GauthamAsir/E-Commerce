import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/services/auth_service.dart';
import 'package:shop_app/services/product_service.dart';
import 'package:shop_app/utils/routes.dart';
import 'package:shop_app/utils/theme.dart';

import 'utils/constants.dart';

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  await initServices();
  runApp(MyApp());
}

Future initServices() async {
  await GetStorage.init(kStorageBoxName);
  await Get.putAsync<AuthService>(() => AuthService().init());
  await Get.putAsync<ProductService>(() => ProductService().init());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '$kAppName Demo',
      theme: theme(),
      initialRoute: initialRoute,
      getPages: routes,
      locale: const Locale('en', 'EN'),
    );
  }
}

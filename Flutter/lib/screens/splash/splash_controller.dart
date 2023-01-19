import 'package:get/get.dart';
import 'package:shop_app/utils/constants.dart';

class SplashController extends GetxController {
  RxInt currentPage = 0.obs;

  RxBool? loggedIn;

  @override
  void onInit() {
    isLoggedIn();
    super.onInit();
  }

  Future<void> isLoggedIn() async {
    int? id = getIntFromBox(kCurrentUserId);

    // await Future.delayed(const Duration(seconds: 1), () {});

    loggedIn = (id != null).obs;
    print(loggedIn!.value);
  }

  RxList<Map<String, String>> splashData = [
    {
      "text": "Welcome to $kAppName, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people connect with store \naround all States in India",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ].obs;
}

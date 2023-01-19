import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/auth/login/login_screen.dart';
import 'package:shop_app/screens/splash/components/splash_content.dart';
import 'package:shop_app/screens/splash/splash_controller.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/utils/size_config.dart';

class SplashBody extends GetView<SplashController> {
  final PageController pageController = PageController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Obx(() => Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      controller.currentPage.value = value;
                    },
                    itemCount: controller.splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      image: controller.splashData[index]["image"],
                      text: controller.splashData[index]['text'],
                    ),
                  ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                            controller.splashData.length,
                            (index) => AnimatedContainer(
                              duration: kAnimationDuration,
                              margin: EdgeInsets.only(right: 5),
                              height: 6,
                              width: controller.currentPage.value == index
                                  ? 20
                                  : 6,
                              decoration: BoxDecoration(
                                color: controller.currentPage.value == index
                                    ? kPrimaryColor
                                    : Color(0xFFD8D8D8),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        if (controller.currentPage.value ==
                                controller.splashData.length - 1) {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                              return;
                            }
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeIn);
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

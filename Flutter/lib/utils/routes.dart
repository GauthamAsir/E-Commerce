import 'package:get/get.dart';
import 'package:shop_app/bindings/auth.controller.binding.dart';
import 'package:shop_app/bindings/cart.controller.binding.dart';
import 'package:shop_app/bindings/splash.controller.binding.dart';
import 'package:shop_app/screens/auth/login/login_screen.dart';
import 'package:shop_app/screens/auth/login_success/login_success_screen.dart';
import 'package:shop_app/screens/auth/sign_up/sign_up_screen.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here

final initialRoute = SplashScreen.routeName;

final List<GetPage> routes = [
  GetPage(
      name: SplashScreen.routeName,
      page: () => SplashScreen(),
      binding: SplashControllerBinding()),
  GetPage(
      name: LoginScreen.routeName,
      page: () => LoginScreen(),
      binding: AuthControllerBinding()),
  GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => ForgotPasswordScreen(),
      binding: null),
  GetPage(
      name: LoginSuccessScreen.routeName,
      page: () => LoginSuccessScreen(),
      binding: null),
  GetPage(
      name: SignUpScreen.routeName, page: () => SignUpScreen(), binding: null),
  GetPage(
      name: CompleteProfileScreen.routeName,
      page: () => CompleteProfileScreen(),
      binding: null),
  GetPage(name: OtpScreen.routeName, page: () => OtpScreen(), binding: null),
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen(), binding: null),
  GetPage(
      name: DetailsScreen.routeName,
      page: () => DetailsScreen(),
      binding: null),
  GetPage(
      name: CartScreen.routeName,
      page: () => CartScreen(),
      binding: CartControllerBinding()),
  GetPage(
      name: ProfileScreen.routeName,
      page: () => ProfileScreen(),
      binding: null),
];

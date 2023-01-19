import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/utils/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const kDefaultAnimDuration = Duration(milliseconds: 250);

const localBaseUrl = 'https://localhost:44386';
const kAppName = 'E-Commerce';
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kInvalidPhoneNoError = "Please Enter Valid Email";
const String kAddressNullError = "Please Enter your address";
const String kCurrentUserId = "userid";
const String kCurrentUserEmail = "userEmail";
const String kStorageBoxName = "MyStorage";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

Uri getUrl(List params) {
  return Uri(
      scheme: 'https',
      host: '192.168.31.19',
      path: '/api/${params.join('/')}',
      port: 4040);
}

getSnack(String title, String message) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black26,
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  );
}

/// Getx Storage static methods
void saveDataToBox(String key, dynamic value) {
  var s = GetStorage(kStorageBoxName);
  s.write(key, value);
  s.save();
}

int? getIntFromBox(String key) => GetStorage(kStorageBoxName).read(key);

String? getStringFromBox(String key) => GetStorage(kStorageBoxName).read(key);

bool? getBoolFromBox(String key) => GetStorage(kStorageBoxName).read(key);

double? getDoubleFromBox(String key) => GetStorage(kStorageBoxName).read(key);

dynamic getDataFromBox(String key) => GetStorage(kStorageBoxName).read(key);

void clearDataFromBox() async => GetStorage(kStorageBoxName).erase();

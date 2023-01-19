import 'package:shop_app/models/UserDetail.dart';
import 'package:shop_app/services/auth_service.dart';

class AuthProvider {
  AuthService authService = AuthService();

  int? currentUserId;

  Future<UserDetail?> getCurrentUser() async {
    if (authService.userDetail == null) {
      await authService.getCurrentUser();
    }
    return Future.value(authService.userDetail);
  }

  Future<Map> login(String email, String password) async {
    var res = await authService.login(email, password);
    res.update('status', (value) => (value as int) == 1 ? true : false,
        ifAbsent: () => false);

    return res;
  }

  Future<Map> signUp(String email, String password, String phone, String fName,
      String lName, DateTime dob) async {
    var res = await authService.signUp(
        UserDetail(
            userName: email.split('@').first,
            firstName: fName,
            lastName: lName,
            dateOfBirth: dob,
            phoneNo: phone,
            email: email),
        password);
    return res;
  }

  Future<Map> forgotPassword() async {
    return Future.value({});
  }
}

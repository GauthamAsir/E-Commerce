import 'package:flutter/material.dart';

import 'components/forgot_password_screen_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: ForgotPasswordScreenBody(),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../shared/auth/auth_controller.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(context, response);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}

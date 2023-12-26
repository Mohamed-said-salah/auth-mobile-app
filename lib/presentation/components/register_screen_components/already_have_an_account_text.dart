import 'package:auth_mobile_app/presentation/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///
/// Adds the line that asks [Unregistered] user to [Register] a new account
class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Already have an account?",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const TextSpan(text: '  '),
          TextSpan(
            text: "Log in",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              decorationThickness: 2.5,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await Navigator.pushReplacementNamed(
                  context,
                  LoginScreen.loginScreenRout,
                );
              },
          ),
        ],
      ),
    );
  }
}

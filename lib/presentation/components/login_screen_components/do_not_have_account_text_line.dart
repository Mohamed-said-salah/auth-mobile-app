import 'package:auth_mobile_app/presentation/screens/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///
/// Adds the line that asks [Unregistered] user to [Register] a new account
class DoNotHaveAccountTextLine extends StatelessWidget {
  const DoNotHaveAccountTextLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't have an account?",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const TextSpan(text: '  '),
          TextSpan(
            text: "Register",
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
                  RegisterScreen.registerScreenRout,
                );
              },
          ),
        ],
      ),
    );
  }
}

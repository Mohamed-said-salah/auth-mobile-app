import 'package:flutter/material.dart';

/// add the [remember me checkbox] and the [Forgot password?] link
/// under the password inputField
/// returns [Checkbox] that that takes the response if a user
/// wants to stay `logged in` after closing the app.
class RememberMeCheckbox extends StatefulWidget {
  static bool rememberMeState = false;
  const RememberMeCheckbox({super.key});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckbox> {
  bool _checkBoxValue = RememberMeCheckbox.rememberMeState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            semanticLabel: "Remember me",
            value: _checkBoxValue,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                _checkBoxValue = value ?? false;
              });
              RememberMeCheckbox.rememberMeState = _checkBoxValue;
            }),
        const Text(
          'Remember me',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

///
/// Directs the user to `helper page`, when [Can't register]
class HaveAProblemLink extends StatelessWidget {
  const HaveAProblemLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // todo: implement have a problem here
      },
      child: const Text(
        "Have a problem?",
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          decorationThickness: 2.5,
        ),
      ),
    );
  }
}

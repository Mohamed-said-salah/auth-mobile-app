import 'package:flutter/material.dart';

class TitleBelowSquareAvatar extends StatelessWidget {
  final String text;
  const TitleBelowSquareAvatar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: "Inter",
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Color(0xff2a2b2e),
          height: 24 / 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

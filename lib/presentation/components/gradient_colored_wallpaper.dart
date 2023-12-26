import 'package:flutter/material.dart';

class GradientColoredWallpaper extends StatelessWidget {
  const GradientColoredWallpaper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182.3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: const Image(
        image: AssetImage("assets/gradient_background.png"),
      ),
    );
  }
}

import 'package:auth_mobile_app/presentation/components/gradient_colored_wallpaper.dart';
import 'package:auth_mobile_app/presentation/components/profile_square_avatar.dart';
import 'package:auth_mobile_app/presentation/components/title_below_square_avatar.dart';
import 'package:flutter/material.dart';

class ScreenBasicWidget extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String? assetImagePath;
  final List children;
  const ScreenBasicWidget({
    super.key,
    required this.title,
    this.imageUrl,
    this.assetImagePath,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Stack(
              children: [
                const GradientColoredWallpaper(),
                ProfileSquareAvatar(
                  imageUrl: imageUrl,
                  assetImagePath: assetImagePath,
                ),
                Column(
                  children: [
                    const SizedBox(height: 275),
                    TitleBelowSquareAvatar(text: title),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}

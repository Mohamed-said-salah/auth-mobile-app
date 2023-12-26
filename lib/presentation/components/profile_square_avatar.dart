import 'package:flutter/material.dart';

/// To use this you must use it in a stack as it's overlays the screen widgets
class ProfileSquareAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? assetImagePath;
  const ProfileSquareAvatar({
    super.key,
    this.imageUrl,
    this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      right: (MediaQuery.of(context).size.width / 2) - 62.5,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 241, 238, 238),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
        child: _getImage(),
      ),
    );
  }

  Image _getImage() {
    Image image = Image(
      height: 125,
      width: 125,
      image: AssetImage(assetImagePath ?? "assets/intern2grow.png"),
    );
    if (imageUrl != null) {
      try {
        image = Image.network(
          imageUrl!,
          height: 125,
          width: 125,
          fit: BoxFit.fill,
        );
      } catch (e) {
        print('Failed to getting network image!!!!');
      }
    }
    return image;
  }
}

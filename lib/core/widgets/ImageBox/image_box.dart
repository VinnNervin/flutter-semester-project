import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ImageBoxConfig {
  final double width;
  final double height;
  final double radius;
  final Color borderColor;
  final double borderWidth;

  const ImageBoxConfig({
    this.width = 50,
    this.height = 50,
    this.radius = 50,
    this.borderColor = AppColors.white,
    this.borderWidth = 0,
  });
}

class ImageBox extends StatelessWidget {
  final ImageProvider image;
  final ImageBoxConfig config;

  const ImageBox._({required this.image, required this.config});

  factory ImageBox.network(
    String url, {
    ImageBoxConfig config = const ImageBoxConfig(),
  }) {
    return ImageBox._(image: NetworkImage(url), config: config);
  }

  factory ImageBox.assest(
    String path, {
    ImageBoxConfig config = const ImageBoxConfig(),
  }) {
    return ImageBox._(image: AssetImage(path), config: config);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: config.width,
      height: config.height,
      decoration: BoxDecoration(
        border: config.borderWidth > 0
            ? Border.all(color: config.borderColor, width: config.borderWidth)
            : null,
        borderRadius: BorderRadius.all(Radius.circular(config.radius)),
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
    );
  }
}

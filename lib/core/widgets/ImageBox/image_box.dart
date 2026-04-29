import 'package:first_app/core/widgets/ImageBox/image_box_config.dart';
import 'package:flutter/material.dart';

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

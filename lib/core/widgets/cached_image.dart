import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/core/constants/app_colors.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
  });

  final String imagePath;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      width: width,
      height: height,
      color: AppColors.kWhiteColor,
      fit: BoxFit.fill,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
            colorFilter: const ColorFilter.mode(
              AppColors.kWhiteColor,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

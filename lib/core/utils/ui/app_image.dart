import 'package:colorize_image/core/utils/constants/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String? imageLocalPath;
  final String? imageUrl;
  final Uint8List? imageBytes;

  final double? width;
  final double? height;
  final double? borderRadius;

  const AppImage.asset({super.key, required this.imageLocalPath, this.width,this.height, this.borderRadius})
      : imageUrl = null, imageBytes = null;

  const AppImage.network(
      {super.key, required this.imageUrl, this.width,this.height, this.borderRadius})
      : imageLocalPath = null, imageBytes = null;

  const AppImage.memory(
      {super.key, required this.imageBytes, this.width,this.height, this.borderRadius})
      : imageUrl = null, imageLocalPath = null;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),

      child: imageUrl != null
        ? Image.network(
            imageUrl!,
            fit: BoxFit.cover,
            width: width,
            height: height,
            loadingBuilder: (context, child, loadingProgress) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.black90,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const _BuildErrorImageView();
            },
          )
        : imageBytes != null
           ? Image.memory(
              imageBytes!,
              fit: BoxFit.cover,
              width: width,
              height: height,
              errorBuilder: (context, error, stackTrace) {
                return const _BuildErrorImageView();
              },
            )
           : Image.asset(
               imageLocalPath!,
               fit: BoxFit.cover,
                width: width,
                height: height,
               errorBuilder: (context, error, stackTrace) {
                return const _BuildErrorImageView();
              },
            ),
    );
  }
}

class _BuildErrorImageView extends StatelessWidget {
  const _BuildErrorImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.image_not_supported_outlined),
      ),
    );
  }
}

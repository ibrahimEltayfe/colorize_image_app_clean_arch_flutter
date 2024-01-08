import 'package:colorize_image/core/utils/constants/app_colors.dart';
import 'package:colorize_image/core/utils/constants/app_dimensions.dart';
import 'package:colorize_image/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  const GradientText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: AppColors.primaryGradientColor,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: AppTextStyles.bold(fontSize: AppDimensions.smallDisplay),
      ),

    );
  }
}

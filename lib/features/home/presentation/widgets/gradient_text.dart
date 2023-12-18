import 'package:colorize_image/core/utils/constants/app_dimensions.dart';
import 'package:colorize_image/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final List<Color> gradientColors;
  final String text;
  final TextStyle? textStyle;
  const GradientText({super.key, required this.gradientColors, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: gradientColors,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: textStyle ?? AppTextStyles.bold(
          fontSize: AppDimensions.large,
        ),
      ),
    );
  }
}

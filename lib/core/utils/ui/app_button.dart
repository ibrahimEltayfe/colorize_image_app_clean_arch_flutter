import 'package:colorize_image/core/utils/constants/app_colors.dart';
import 'package:colorize_image/core/utils/constants/app_dimensions.dart';
import 'package:colorize_image/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{
  final String title;
  final double? fontSize;
  final double width;
  final Function()? onTap;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.onTap,
    required this.title,
    this.fontSize,
    this.width = 330,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),

      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: width,
          height: AppDimensions.buttonHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.medium,vertical: AppPadding.small),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: onTap == null ? AppColors.disabledGradientColors :AppColors.primaryGradientColor
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(title,style: AppTextStyles.bold(
                  color: AppColors.white,
                  fontSize: AppDimensions.large
                ),),
              ),

              if(isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.small),
                  child: SizedBox(
                    height: AppDimensions.buttonHeight / 2,
                    width: AppDimensions.buttonHeight / 2,
                    child: CircularProgressIndicator(color: AppColors.white,)
                  ),
                )
            ],
          )
        ),
      ),
    );
  }



}
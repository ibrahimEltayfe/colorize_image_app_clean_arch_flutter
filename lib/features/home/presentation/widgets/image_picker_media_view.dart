import 'package:colorize_image/core/utils/constants/app_colors.dart';
import 'package:colorize_image/core/utils/constants/app_dimensions.dart';
import 'package:colorize_image/core/utils/constants/app_styles.dart';
import 'package:colorize_image/core/utils/injector/injector_config.dart';
import 'package:colorize_image/core/utils/services/media_picker.dart';
import 'package:colorize_image/core/utils/ui/app_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerAreaView extends StatefulWidget {
  final Function(XFile file) onPickImage;
  const ImagePickerAreaView({super.key,required this.onPickImage});

  @override
  State<ImagePickerAreaView> createState() => _ImagePickerAreaViewState();
}

class _ImagePickerAreaViewState extends State<ImagePickerAreaView> {
  XFile? imageFile;
  final double height = 265;
  final double width = 330;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        injector<AppMediaPicker>().onPickImage(
          onPick: (file) {
            imageFile = file;
            setState(() {});

            widget.onPickImage(file);
          },
          onError: (errorMessage) {
            Fluttertoast.showToast(
              msg: errorMessage,
              backgroundColor: AppColors.red,
              textColor: AppColors.white
            );
          },
        );
      },
      child: DottedBorder(
        color: AppColors.black70,
        dashPattern: const [4,4],
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: const Radius.circular(AppDimensions.mediumBorderRadius),
        child: SizedBox(
          width: width,
          height: height,
          child: imageFile != null
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppImage.file(
              imageFilePath: imageFile!.path,
              height: height,
              width: width,
            ),
          ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_photo_alternate_rounded,color: AppColors.grey,size: 35,),
              const SizedBox(height: AppPadding.small,),
              Text(
                "Pick Image",
                style: AppTextStyles.medium(
                    color: AppColors.black70,
                    fontSize: AppDimensions.large
                )
              )
             ]
            )
          ),
        ),
    );
  }
}

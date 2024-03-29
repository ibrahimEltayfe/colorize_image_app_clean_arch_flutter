import 'dart:developer';
import 'dart:typed_data';

import 'package:colorize_image/core/utils/constants/app_colors.dart';
import 'package:colorize_image/core/utils/constants/app_dimensions.dart';
import 'package:colorize_image/core/utils/constants/app_styles.dart';
import 'package:colorize_image/core/utils/error_handling/failures_handler.dart';
import 'package:colorize_image/core/utils/ui/app_button.dart';
import 'package:colorize_image/core/utils/ui/app_image.dart';
import 'package:colorize_image/features/home/domain/use_cases/save_image_to_gallery.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageDownloadPage extends StatefulWidget {
  final Uint8List imageBytes;
  const ImageDownloadPage({super.key, required this.imageBytes});

  static const String routeName = "ImageDownloadPage";

  @override
  State<ImageDownloadPage> createState() => _ImageDownloadPageState();
}

class _ImageDownloadPageState extends State<ImageDownloadPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("YOUR COLORIZED IMAGE",style: AppTextStyles.bold(
            fontSize: AppDimensions.xxLarge
        ),),
      ),

      body: SafeArea(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage.memory(imageBytes: widget.imageBytes),

              const SizedBox(height: AppPadding.medium,),

              AppButton(onTap: _saveImageToGallery, title: "Save",isLoading: isLoading,)
            ],
          ),
        ),
      ),
    );
  }

  void _saveImageToGallery() async{
    setState(() {
      isLoading = true;
    });

    await failuresHandler(() async{
       final imagePath = await SaveImageToGalleryUseCase().call(widget.imageBytes);
      log(imagePath.toString());
      Fluttertoast.showToast(msg: "Image saved successfully to your device.",backgroundColor: AppColors.green,textColor: AppColors.white);
    }, onError: (failure) {
      Fluttertoast.showToast(msg: failure.message,backgroundColor: AppColors.red,textColor: AppColors.white);
    },);


    setState(() {
      isLoading = false;
    });
  }
}

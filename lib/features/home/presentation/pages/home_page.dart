import 'package:colorize_image/core/utils/constants/app_colors.dart';
import 'package:colorize_image/core/utils/constants/app_dimensions.dart';
import 'package:colorize_image/core/utils/constants/app_image_paths.dart';
import 'package:colorize_image/core/utils/constants/app_styles.dart';
import 'package:colorize_image/core/utils/ui/app_button.dart';
import 'package:colorize_image/core/utils/ui/app_image.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input.dart';
import 'package:colorize_image/features/home/presentation/manager/colorize_image_cubit.dart';
import 'package:colorize_image/features/home/presentation/pages/image_download_page.dart';
import 'package:colorize_image/features/home/presentation/widgets/gradient_text.dart';
import 'package:colorize_image/features/home/presentation/widgets/image_picker_media_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = "HomePage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorizeImageCubit(),
      child: const _HomeBody(),
    );
  }
}


class _HomeBody extends  StatefulWidget {
  const _HomeBody({super.key});

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const GradientText(
                      text: "COLORIZE ",
                    ),

                    Text("YOUR IMAGE", style: AppTextStyles.bold(fontSize: AppDimensions.smallDisplay),)
                  ],
                ),

                const SizedBox(height: AppPadding.xxLarge,),

                SizedBox(
                  width: 350,
                  height: 180,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Transform.rotate(
                          angle: 50,
                          child: AppImage.asset(
                            imageAssetPath: AppImagePaths.blackAndWhiteImage,
                            width: 150,
                            height: 130,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        left: 124,
                        child: AppImage.asset(
                          imageAssetPath: AppImagePaths.coloredImage,
                          width: 230,
                          height: 170,
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: AppPadding.mediumDisplay,),

                ImagePickerAreaView(
                  onPickImage: (file) {
                    imageFile = file;
                  },
                ),

                SizedBox(height: AppPadding.xxLarge,),

                BlocConsumer<ColorizeImageCubit,ColorizeImageState>(
                  listener: (context, state) {
                    if(state is ColorizeImageFailure){
                      Fluttertoast.showToast(msg: state.errorMessage,backgroundColor: AppColors.red,textColor: AppColors.white);
                    }else if(state is ColorizeImageSuccess){
                      Navigator.pushNamed(context, ImageDownloadPage.routeName,arguments: state.colorizedImageBytes);
                    }
                  },
                  builder: (context,state) {
                    return AppButton(
                      onTap: (){
                        if(imageFile == null){
                          Fluttertoast.showToast(msg: "Please pick an image",backgroundColor: AppColors.red,textColor: AppColors.white);
                          return;
                        }

                        final imageInput = ColorizeImageInput(
                          imageFile: imageFile!
                        );

                        context.read<ColorizeImageCubit>().generateColorizedImage(imageInput);
                      },
                      isLoading: state is ColorizeImageLoading,
                      title: "Generate"
                    );
                  }
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

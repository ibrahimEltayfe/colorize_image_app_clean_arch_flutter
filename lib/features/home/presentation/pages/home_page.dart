import 'package:colorize_image/core/utils/constants/app_colors.dart';
import 'package:colorize_image/core/utils/constants/app_dimensions.dart';
import 'package:colorize_image/core/utils/constants/app_image_paths.dart';
import 'package:colorize_image/core/utils/constants/app_styles.dart';
import 'package:colorize_image/core/utils/extensions/mediaquery_size.dart';
import 'package:colorize_image/core/utils/ui/app_button.dart';
import 'package:colorize_image/core/utils/ui/app_image.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input_entity.dart';
import 'package:colorize_image/features/home/presentation/manager/colorize_image_cubit.dart';
import 'package:colorize_image/features/home/presentation/pages/image_download_page.dart';
import 'package:colorize_image/features/home/presentation/widgets/gradient_text.dart';
import 'package:colorize_image/features/home/presentation/widgets/image_picker_area_view.dart';
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


class _HomeBody extends StatefulWidget {
  const _HomeBody({super.key});

  @override
  State<_HomeBody> createState() => __HomeBodyState();
}

class __HomeBodyState extends State<_HomeBody> {
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
                    GradientText(
                      gradientColors: AppColors.primaryGradientColor,
                      text: "COLORIZE ",
                      textStyle: AppTextStyles.bold(
                        fontSize: AppDimensions.smallDisplay-2
                      ),
                    ),

                    Text("YOUR IMAGE",style: AppTextStyles.bold(
                        fontSize: AppDimensions.smallDisplay-2
                    ),)
                  ],
                ),

                SizedBox(height: AppPadding.xxLarge,),

                SizedBox(
                  width: 350,
                  height: 180,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      Positioned(
                        left: 2,
                        top: 0,
                        child: Transform.rotate(
                          angle: 50,

                          child: const AppImage.asset(
                            imageLocalPath: AppImagePaths.blackAndWhiteImage,
                            width: 150,
                            height: 130,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        left: 124,
                        child: AppImage.asset(
                          imageLocalPath: AppImagePaths.coloredImage,
                          width: 230,
                          height: 170,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppPadding.mediumDisplay,),

                ImagePickerAreaView(
                  onPickImage : (XFile file){
                    imageFile = file;
                  }
                ),

                SizedBox(height: AppPadding.xLarge,),

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
                      onTap: () {
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
                      width: 332,
                      title: "Generate",
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

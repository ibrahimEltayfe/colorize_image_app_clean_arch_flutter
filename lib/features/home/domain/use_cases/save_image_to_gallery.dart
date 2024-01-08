import 'dart:typed_data';

import 'package:colorize_image/core/utils/error_handling/failures.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SaveImageToGalleryUseCase{
  Future<String> call(Uint8List imageBytes) async{

    final results = await ImageGallerySaver.saveImage(
      imageBytes,
      quality: 100,
      name: 'colorize-image-${DateTime.now().millisecondsSinceEpoch}'
    );

    if(results["isSuccess"] == true){
      if(results["filePath"] == null){
        throw const CouldNotSaveImageFailure();
      }

      return results["filePath"];
    }else{
      throw const CouldNotSaveImageFailure();
    }
  }
}
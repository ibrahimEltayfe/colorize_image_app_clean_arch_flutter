import 'dart:convert';
import 'dart:typed_data';
import 'package:colorize_image/core/error_handling/failures.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SaveImageToGalleryUseCase{
  Future<String?> execute(Uint8List? bytes) async{
    if(bytes == null) return '';

    final results = await ImageGallerySaver.saveImage(
      bytes,
      quality: 100,
      name: "colorized-image-${DateTime.now().millisecondsSinceEpoch}",
    );

    if(results["isSuccess"] == true){
      return results["filePath"];
    }else{
      throw const CouldNotSaveImageFailure();
    }
  }
}
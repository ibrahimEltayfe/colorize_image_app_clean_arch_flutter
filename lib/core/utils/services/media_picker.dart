import 'package:image_picker/image_picker.dart';

class AppMediaPicker {
  final _mediaPicker = ImagePicker();

  void onPickImage({
    required Function(XFile imageFile) onPick,
    required Function(String errorMessage) onError
  }) async {
     try{
       final imageFile = await _mediaPicker.pickImage(
         source: ImageSource.gallery,
         imageQuality: 70
       );

       if (imageFile != null) {
         onPick(imageFile);
       }else{
         onError("Could not retrieve the image");
       }
     }catch(e){
       onError("Could not retrieve the image");
     }
  }
}
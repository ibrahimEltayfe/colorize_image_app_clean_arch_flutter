class ImageResponseModel {
  int? status;
  String? message;
  ColorizedImageModel? data;

  ImageResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ImageResponseModel.fromJson(Map<String, dynamic> json) => ImageResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ColorizedImageModel.fromJson(json["data"]),
  );
}

class ColorizedImageModel {
  String? image;

  ColorizedImageModel({
    this.image,
  });

  factory ColorizedImageModel.fromJson(Map<String, dynamic> json) => ColorizedImageModel(
    image: json["image"],
  );
}

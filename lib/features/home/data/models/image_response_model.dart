class ImageResponseModel {
  int? status;
  ColorizedImageModel? data;
  String? message;

  ImageResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory ImageResponseModel.fromJson(Map<String, dynamic> json) => ImageResponseModel(
    status: json["status"],
    data: json["data"] == null ? null : ColorizedImageModel.fromJson(json["data"]),
    message: json["message"],
  );
}

class ColorizedImageModel {
  int? completedAt;
  int? createdAt;
  String? image;
  int? processedAt;
  int? progress;
  int? returnType;
  int? state;
  String? stateDetail;
  String? taskId;

  ColorizedImageModel({
    this.completedAt,
    this.createdAt,
    this.image,
    this.processedAt,
    this.progress,
    this.returnType,
    this.state,
    this.stateDetail,
    this.taskId,
  });

  factory ColorizedImageModel.fromJson(Map<String, dynamic> json) => ColorizedImageModel(
    completedAt: json["completed_at"],
    createdAt: json["created_at"],
    image: json["image"],
    processedAt: json["processed_at"],
    progress: json["progress"],
    returnType: json["return_type"],
    state: json["state"],
    stateDetail: json["state_detail"],
    taskId: json["task_id"],
  );
}

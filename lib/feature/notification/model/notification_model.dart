class NotificationModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;
  String? errorMsg;
  NotificationModel(
      {this.status, this.statusCode, this.message, this.data, this.errorMsg});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  NotificationModel.withError(String errorMsg) {
    errorMsg = errorMsg;
  }
}

class Data {
  int? id;
  String? title;
  String? content;
  String? bannerImg;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.content,
      this.bannerImg,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    bannerImg = json['banner_img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

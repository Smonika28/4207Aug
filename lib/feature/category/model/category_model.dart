class CategoryModel {
  bool? success;
  String? message;
  List<Data>? data;
  String? errorMsg;
  CategoryModel({this.success, this.message, this.data, this.errorMsg});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  CategoryModel.withError(String errorMsg) {
    errorMsg = errorMsg;
  }
}

class Data {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? metaTitle;
  String? metaDescription;
  int? status;
  int? main;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.metaTitle,
      this.metaDescription,
      this.status,
      this.main,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    status = json['status'];
    main = json['main'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

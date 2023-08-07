class AboutUsModel {
  bool? status;
  String? message;
  String? statusCode;
  Data? data;
  String? errorMsg;


  AboutUsModel({this.status, this.message, this.statusCode, this.data, this.errorMsg});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  AboutUsModel.withError(String errorMsg) {
    errorMsg = errorMsg;
  }
}

class Data {
  int? id;
  String? title;
  String? bannerImg;
  String? section1Name;
  String? section1Title;
  String? section1Description;
  String? section1Img;
  String? section2Title;
  String? section2Name;
  String? section2Description;
  String? section2Img;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.bannerImg,
        this.section1Name,
        this.section1Title,
        this.section1Description,
        this.section1Img,
        this.section2Title,
        this.section2Name,
        this.section2Description,
        this.section2Img,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bannerImg = json['banner_img'];
    section1Name = json['section_1_name'];
    section1Title = json['section_1_title'];
    section1Description = json['section_1_description'];
    section1Img = json['section_1_img'];
    section2Title = json['section_2_title'];
    section2Name = json['section_2_name'];
    section2Description = json['section_2_description'];
    section2Img = json['section_2_img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
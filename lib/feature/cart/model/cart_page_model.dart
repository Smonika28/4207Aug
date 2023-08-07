class AddListModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  AddListModel({this.status, this.statusCode, this.message, this.data});

  AddListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  int? id;
  String? userId;
  String? sessionId;
  int? productId;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userId,
        this.sessionId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sessionId = json['session_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

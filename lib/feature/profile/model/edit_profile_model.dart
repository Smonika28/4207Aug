class EditProfileModel {
  String? message;
  Data? data;
  String? errorMsg;

  EditProfileModel({this.message, this.data, this.errorMsg});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  EditProfileModel.withError(String errorMsg) {
    errorMsg = errorMsg;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? dob;
  String? gender;
  String? homeAddress;
  String? emailVerifiedAt;
  String? profilePicture;
  String? address;
  String? city;
  String? country;
  String? pincode;
  String? socialId;
  String? socialType;
  int? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.dob,
        this.gender,
        this.homeAddress,
        this.emailVerifiedAt,
        this.profilePicture,
        this.address,
        this.city,
        this.country,
        this.pincode,
        this.socialId,
        this.socialType,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    gender = json['gender'];
    homeAddress = json['home_address'];
    emailVerifiedAt = json['email_verified_at'];
    profilePicture = json['profile_picture'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    pincode = json['pincode'];
    socialId = json['social_id'];
    socialType = json['social_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

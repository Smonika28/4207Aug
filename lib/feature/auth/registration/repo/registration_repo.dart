// import '../../../../utils/Api/api_provider.dart';
//
// class LoginRepository {
//   final apiProvider = ApiProvider();
//   RegistrationModel sellerLoginModel = RegistrationModel();
//   Future<dynamic> getLogin(Map<String, dynamic> reqModel) {
//     var registration;
//     return apiProvider.dataProcessor(reqModel, RegistrationModel, Apis.registration);
//   }
// }
//
// class Apis {
// }
//
// class RegistrationModel {
// }
//
// class NetworkError extends Error {}


// import 'package:groomely_seller/core/api/api_string.dart';
// import 'package:groomely_seller/feature/login/model/seller_login_res_model.dart';
// import 'package:groomely_seller/utils/APi/api_provider.dart';

import 'package:dio/dio.dart';

import '../../../../constants/apis_path/api_config_string.dart';
import '../../../../utils/Api/api_provider.dart';
import '../../../../utils/local_storage/local_storage.dart';
import '../model/registration_model.dart';

class SignupRepository{
  final apiProvider = ApiProvider();
  SignupModel userSignupModel = SignupModel();
  Future<dynamic> getSignup(Map<String,dynamic> reqModel){
    return apiProvider.dataProcessor(reqModel, userSignupModel,ApiEndPoints.signup);
  }
}
class NetworkError extends Error {}

//
// class SignupRepository{
//   final Dio _dio = Dio();
//   LocalStorageService localStorageService = LocalStorageService();
//   final apiProvider = ApiProvider();
//   SignupModel sellerSignupModel = SignupModel();
//   Future<SignupModel> getSignup(Map<String,dynamic> reqModel)async {
//     String resMsg = "";
//
//     try{
//       var response = await _dio.post(ApiEndPoints.signup,data: reqModel);
//       print('response --> $response');
//       // var jsonResponse = json.decode(response.data);
//       print("jsonResponse--> ${response.data}");
//
//       if(response.statusCode ==200){
//         // resMsg = jsonResponse['message'];
//         print(resMsg);
//         sellerSignupModel = SignupModel.fromJson(response.data);
//         print("sellerSignupModel--> ${sellerSignupModel.token}");
//         print("sellerSignupModel--> ${sellerSignupModel.status}");
//         return sellerSignupModel;
//       }
//       else {
//         throw NetworkError();
//       }
//
//
//     }
//     catch(e){
//       print("error");
//       return sellerSignupModel;
//     }
//
//   }
// }
//
// class NetworkError extends Error {}
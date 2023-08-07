// import 'package:groomely_seller/core/api/api_string.dart';
// import 'package:groomely_seller/feature/login/model/seller_login_res_model.dart';
// import 'package:groomely_seller/utils/APi/api_provider.dart';

import '../../../../constants/apis_path/api_config_string.dart';
import '../../../../utils/Api/api_provider.dart';
import '../model/login_model.dart';

class LoginRepository{
  final apiProvider = ApiProvider();
  UserLoginModel userLoginModel = UserLoginModel();
  Future<dynamic> getLogin(Map<String,dynamic> reqModel)async{
    return await apiProvider.dataProcessor(reqModel, userLoginModel,ApiEndPoints.login);
  }
}
class NetworkError extends Error {}
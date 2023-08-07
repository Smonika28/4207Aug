import 'dart:math';
import "package:flutter/material.dart";
import 'package:four20society/feature/auth/login/model/login_model.dart';
import 'package:four20society/feature/auth/login/repo/login_repo.dart';
import 'package:four20society/utils/local_storage/local_storage.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'seller_login_event.dart';
part 'seller_login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    LoginRepository repository = LoginRepository();
    on<LoginEvents>((event, emit) async {
      Map<String, dynamic> requestModel = {
        "email": event.email,
        "password": event.password,
        "user_type":"Seller"
      };
      try {
        emit(LoginLodingState());
         print(requestModel);
        final myList = await repository.getLogin(requestModel);
        print('myListdata--> $myList');
        print("statusss-->  ${myList.status}");
        if (myList.status == true) {
          LocalStorageService()
              .saveToDisk(LocalStorageService.ACCESS_TOKEN_KEY, myList.data.authToken);
          emit(LoginLoadedState(responseModel: myList));
        } else {
          emit(LoginErrorState(errorMsg: myList.message.toString()));
        }
      } on NetworkError {
        emit(LoginErrorState(errorMsg: "No Internet Connection"));
      }
    });
  }
}

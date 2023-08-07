// part of 'seller_login_bloc.dart';
//
// abstract class LoginState {}
//
// class LoginInitial extends LoginState {}
//
// class LoginLodingState extends LoginState{}
//
// class LoginLoadedState extends LoginState{
//   LoginModel responseModel;
//   LoginLoadedState({required this.responseModel});
// }
//
// class LoginErrorState extends LoginState{
//   String errorMsg;
//   LoginErrorState({required this.errorMsg});
// }

part of 'seller_login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLodingState extends LoginState{}

class LoginLoadedState extends LoginState{
  UserLoginModel responseModel;
  LoginLoadedState({required this.responseModel});
}

class LoginErrorState extends LoginState{
  String errorMsg;
  LoginErrorState({required this.errorMsg});
}

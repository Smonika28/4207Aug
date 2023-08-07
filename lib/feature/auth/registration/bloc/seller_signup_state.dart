part of 'seller_signup_bloc.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLodingState extends SignupState{}

class SignupLoadedState extends SignupState{
  SignupModel responseModel;
  SignupLoadedState({required this.responseModel});
}

class SignupErrorState extends SignupState{
  String errorMsg;
  SignupErrorState({required this.errorMsg});
}






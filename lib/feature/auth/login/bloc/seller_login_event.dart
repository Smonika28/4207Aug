


 part of 'seller_login_bloc.dart';

@immutable
abstract class LoginEvent {}

// ignore: must_be_immutable
class LoginEvents extends LoginEvent{
  String email;
  String password;
  String user_type;

  LoginEvents({required this.email, required this.password, required this.user_type,
 });
}
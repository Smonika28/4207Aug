
part of 'seller_signup_bloc.dart';

@immutable
abstract class SignupEvent {}

// ignore: must_be_immutable
class SignupEvents extends SignupEvent{

  String name;
  String password;
  String confirmPassword;
  String email;
  String phone;
  String user_type;



  SignupEvents({required this.name, required this.password,
    required this.confirmPassword, required this.email, required this.phone, required this.user_type  });
}

// abstract class SellerSignupEvent extends Equatable {
//   const SellerSignupEvent();
//   @override
//   List<Object> get props => [];
// }
//
// class SellerSignupSubmittedEvent extends SellerSignupEvent {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String phone;
//   final String zipcode;
//   final String password;
//   final String confirmPassword;
//
//
//   SellerSignupSubmittedEvent(this.firstName, this.lastName, this.email,
//       this.phone, this.zipcode, this.password, this.confirmPassword);
//
//   @override
//   List<Object> get props => [firstName, lastName, phone, email, zipcode, password, confirmPassword];
// }
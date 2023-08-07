import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../utils/local_storage/local_storage.dart';
import '../model/registration_model.dart';
import '../../../../utils/local_storage/local_storage.dart';
import '../model/registration_model.dart';
import '../repo/registration_repo.dart';
part 'seller_signup_event.dart';
part 'seller_signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    SignupRepository repository = SignupRepository();
    on<SignupEvents>((event, emit) async {
      Map<String, dynamic> requestModel = {
        "email": event.email,
        "name": event.name,
        "phone": event.phone,
        "password": event.password,
        "confirm_password": event.confirmPassword,
        "user_type": "BUSINESS_OWNER"
      };
      try {
        emit(SignupLodingState());
        print(requestModel);
        final myList = await repository.getSignup(requestModel);
        print('myListdata--> $myList');
        print("statusss-->  ${myList.status}");
        if (myList.status == true) {
          LocalStorageService().saveToDisk(
              LocalStorageService.ACCESS_TOKEN_KEY, myList.data?.authToken);
          emit(SignupLoadedState(responseModel: myList));
        } else {
          emit(SignupErrorState(errorMsg: myList.message.toString()));
        }
      } on NetworkError {
        emit(SignupErrorState(errorMsg: "No Internet Connection"));
      }
    });
  }
}


// abstract class SellerSignupState extends Equatable {
//   const SellerSignupState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class SellerSignupStateInitial extends SellerSignupState {}
//
// class SellerSignupStateLoading extends SellerSignupState {}
//
// class SellerSignupStateLoaded extends SellerSignupState {
//   final SellerSignupModel sellerSignupModel;
//
//   SellerSignupStateLoaded(this.sellerSignupModel);
//
//   @override
//   List<Object> get props => [sellerSignupModel];
//
// }
//
// class SellerSignupStateFailed extends SellerSignupState {
//   final String errorMessage;
//
//   SellerSignupStateFailed(this.errorMessage);
//
//   @override
//   List<Object> get props => [errorMessage];
// }
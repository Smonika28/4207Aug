import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four20society/constants/colors/app_colors.dart';
import 'package:four20society/constants/routes/routes_name.dart';
import 'package:four20society/global_widget/custom_button.dart';
import 'package:four20society/global_widget/input_fields.dart';
// import '../../../../utils/Api/validate/validation.dart';
import '../../../../utils/Toast/app_toast.dart';
import '../../../dashboard/presentation/dashboards.dart';
import '../bloc/seller_signup_bloc.dart';
import '../utils/validate/validation.dart';

// ignore: must_be_immutable

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfPassController = TextEditingController();
   String radioGroup = "";
  bool isTextObscurePassword = true;
  bool isTextObscureConfrmPassword = true;
   List<String> radioList = ["lbl_seller", "lbl_customer"];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.network("https://wallpapercave.com/wp/wp2490640.jpg",
                fit: BoxFit.cover)),
        Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 50, left: 45, right: 45),
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(214),
                      topRight: Radius.circular(214))),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Register',
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.app_bottombar_color),
                              children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        AppRoute.loginScreen, (route) => false);
                                  },
                                text: ' to',
                                style: const TextStyle(color: Colors.black))
                          ])),
                      const Text("Explore Exciting",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700)),
                      const Text("Things",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 15),
                      InputFieldWidget(
                        controller: nameController,
                        hintText: 'full Name',
                        validator: (input) =>
                            CustomValidation.validateName(input ?? ''),
                      ),
                      InputFieldWidget(
                        controller: emailController,
                        hintText: 'Email Id',
                        validator: (input) => EmailValidator.validate(input!)
                            ? null
                            : "Please valid email id",
                      ),
                      InputFieldWidget(
                        controller: phoneController,
                        hintText: 'Phone Number',
                        validator: (input) =>
                            CustomValidation.validatePhoneNumber(input ?? ''),
                      ),
                      InputFieldWidget(
                        obscureText: isTextObscurePassword,
                        controller: passwordController,
                        hintText: 'Password',
                        validator: (input) =>
                            CustomValidation.validatePassword(input!),
                        sufferIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTextObscurePassword =
                              !isTextObscurePassword;
                            });
                          },
                          child: isTextObscurePassword
                              ? const Icon(
                            Icons.visibility_off_rounded,
                          )
                              : const Icon(
                            Icons.visibility_rounded,
                          ),
                        ),
                      ),
                      InputFieldWidget(
                        obscureText: isTextObscureConfrmPassword,
                        controller: cnfPassController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please re-enter password';
                          }
                          if (passwordController.text !=
                              cnfPassController.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                        hintText: 're-password',
                        sufferIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTextObscureConfrmPassword =
                              !isTextObscureConfrmPassword;
                            });
                          },
                          child: isTextObscureConfrmPassword
                              ? const Icon(
                            Icons.visibility_off_rounded,
                          )
                              : const Icon(
                            Icons.visibility_rounded,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),

                      BlocListener<SignupBloc, SignupState>(
                        listener: (context, state) {
                          print("state --> $state");
                          if (state is SignupLoadedState) {
                            ToastMessage().toast(
                                context: context,
                                message: state.responseModel.message.toString(),
                                messageColor: Colors.white,
                                background: Colors.green);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DashboardScreen()),
                                (route) => false);
                          }
                          else if (state is SignupErrorState) {
                            // ToastMessage().toast(
                            //     duration: 5000,
                            //     context: context,
                            //     message: state.errorMsg.toString(),
                            //     messageColor: Colors.white,
                            //     background: Colors.redAccent);
                            // ToastMessage().toast(
                            //     context: context,
                            //     message: state.responseModel.message.toString(),
                            //     messageColor: Colors.white,
                            //     background: Colors.green);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const DashboardScreen()),
                                    (route) => false);
                          }
                        },
                        child: CustomElevatedButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<SignupBloc>(context).add(
                                  SignupEvents(
                                      name: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      confirmPassword:
                                          cnfPassController.text.trim(),
                                      phone: phoneController.text.trim(),
                                  user_type: "Seller"));
                            }
                          },
                          title: "Registration",
                          color: AppColors.buttonColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                          text: TextSpan(
                              text: 'Already have an account?',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        AppRoute.loginScreen, (route) => false);
                                  },
                                text: ' LOGIN NOW',
                                style: const TextStyle(
                                    color: AppColors.app_bottombar_color))
                          ])),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.facebook_outlined),
                          Icon(Icons.apple),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ))
      ],
    ));
  }
}

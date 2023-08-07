import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../global_widget/custom_button.dart';

class ChangedPassWord extends StatefulWidget {
  const ChangedPassWord({super.key});
  @override
  State<ChangedPassWord> createState() => _ChangedPassWord();
}

class _ChangedPassWord extends State<ChangedPassWord> {
  final TextEditingController _emailController = TextEditingController();
  Future<void> changePassword() async {
    final url = Uri.parse(
        'https://excellis.co.in/420-society-world/api/v1/forgot-password');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode({
      'email': _emailController.text,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Password change request successful');
        }
      } else {
        if (kDebugMode) {
          print('Failed to change password');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('An error occurred: $error');
      }
    }
  }

  bool isTextObscurePassword = true;
  bool isTextObscureNewPassword = true;
  bool isTextObscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 209, 209).withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        top: 13.0,
                        bottom: 13.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffAAAAAA),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            50.0,
                          ),
                        ),
                      ),
                      hintText: 'Current Password',
                      suffix: GestureDetector(
                        // isObscureText: isTextObscurePassword,
                        onTap: () {
                          setState(() {
                            isTextObscurePassword = !isTextObscurePassword;
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
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        top: 13.0,
                        bottom: 13.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffAAAAAA),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            50.0,
                          ),
                        ),
                      ),
                      hintText: 'New Password',
                      suffix: GestureDetector(
                        // isObscureText: isTextObscurePassword,
                        onTap: () {
                          setState(() {
                            isTextObscureNewPassword =
                                !isTextObscureNewPassword;
                          });
                        },
                        child: isTextObscureNewPassword
                            ? const Icon(
                                Icons.visibility_off_rounded,
                              )
                            : const Icon(
                                Icons.visibility_rounded,
                              ),
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        top: 13.0,
                        bottom: 13.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffAAAAAA),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            50.0,
                          ),
                        ),
                      ),
                      hintText: 'Confirm Password',
                      suffix: GestureDetector(
                        // isObscureText: isTextObscurePassword,
                        onTap: () {
                          setState(() {
                            isTextObscureConfirmPassword =
                                !isTextObscureConfirmPassword;
                          });
                        },
                        child: isTextObscureConfirmPassword
                            ? const Icon(
                                Icons.visibility_off_rounded,
                              )
                            : const Icon(
                                Icons.visibility_rounded,
                              ),
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              onTap: () {
                changePassword();
                if (kDebugMode) {
                  print("change password");
                }
              },
              title: 'Save > ',
              color: const Color(0xff00C8B8),
            ),
          ],
        ),
      ),
    );
  }
}

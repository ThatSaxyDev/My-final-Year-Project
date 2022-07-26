import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_news_restart/common/button.dart';
import 'package:project_news_restart/common/text_input.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/constants/utils.dart';
import 'package:project_news_restart/features/auth/screens/signup_screen.dart';
import 'package:project_news_restart/features/auth/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _studentEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _studentEmailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _studentEmailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20,
            ),
            child: Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.height50,
                      bottom: Dimensions.height10 * 25,
                    ),
                    height: Dimensions.height10 * 15,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            Dimensions.radius15,
                          ),
                        ),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/main_logo.png'))),
                    // child: Image.asset('assets/images/main_logo.png'),
                  ),
                  TTinterfacesText(
                    text: 'Log in',
                    size: Dimensions.font10 * 2.4,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: Dimensions.height10 * 0.5,
                  ),
                  TTinterfacesText(
                    text: 'Sign in with your student e-mail',
                    size: Dimensions.font15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(100, 101, 103, 1),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  TextInputBox(
                    hintText: 'Student E-mail',
                    controller: _studentEmailController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter your email';
                      }
                      if (!val.toString().contains('@student.babcock.edu.ng')) {
                        return 'This is not a valid student email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  TextInputBox(
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    obscuretext: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Dimensions.height10 * 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      // if (_loginFormKey.currentState!.validate()) {
                      //   signInUser();
                      // }
                      showSnackBar(
                        context,
                        'Please Wait...',
                      );
                      Timer(
                        const Duration(seconds: 3),
                        () {
                          if (_loginFormKey.currentState!.validate()) {
                            signInUser();
                          }
                        },
                      );
                    },
                    child: Button(
                      content: Center(
                        child: TTinterfacesText(
                          text: 'Log in',
                          size: Dimensions.font16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10 * 2,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'TT Interfaces',
                          fontSize: Dimensions.font10 * 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  SignUpScreen.routeName,
                                );
                              },
                            style: TextStyle(
                              color: Colors.purple,
                              fontFamily: 'TT Interfaces',
                              fontSize: Dimensions.font10 * 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

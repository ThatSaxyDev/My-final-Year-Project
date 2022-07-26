import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_news_restart/common/button.dart';
import 'package:project_news_restart/common/text_input.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/auth/screens/login_screen.dart';
import 'package:project_news_restart/features/auth/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> schools = const [
      DropdownMenuItem(
        value: 'Benjamin S. Carson School of Medicine',
        child: Text(
          'Benjamin S. Carson School of Medicine',
          maxLines: 1,
        ),
      ),
      DropdownMenuItem(
        value: 'Computing and Engineering Sciences',
        child: Text('Computing and Engineering Sciences'),
      ),
      DropdownMenuItem(
        value: 'College of Health and Medical Sciences',
        child: Text('College of Health and Medical Sciences'),
      ),
      DropdownMenuItem(
        value: 'Education And Humanities',
        child: Text('Education And Humanities'),
      ),
      DropdownMenuItem(
        value: 'Law And Security Studies',
        child: Text('Law And Security Studies'),
      ),
      DropdownMenuItem(
        value: 'Management Sciences',
        child: Text('Management Sciences'),
      ),
      DropdownMenuItem(
        value: 'Nursing Sciences',
        child: Text('Nursing Sciences'),
      ),
      DropdownMenuItem(
        value: 'Public and Allied Health',
        child: Text('Public and Allied Health'),
      ),
      DropdownMenuItem(
        value: 'Science And Technology',
        child: Text('Science And Technology'),
      ),
      DropdownMenuItem(
        value: 'Veronica Adeleke School of Social Sciences',
        child: Text('Veronica Adeleke School of Social Sciences'),
      ),
      DropdownMenuItem(
        value: 'Post Graduate',
        child: Text('Post Graduate'),
      ),
    ];
    return schools;
  }

  String? selectedSchool = 'Benjamin S. Carson School of Medicine';
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _studentEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      name: _nameController.text,
      email: _studentEmailController.text,
      password: _passwordController.text,
      school: selectedSchool!,
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
              key: _signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.height50,
                      bottom: Dimensions.height10 * 11,
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
                        image: AssetImage('assets/images/main_logo.png'),
                      ),
                    ),
                    // child: Image.asset('assets/images/main_logo.png'),
                  ),
                  TTinterfacesText(
                    text: 'Welcome',
                    size: Dimensions.font10 * 2.4,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: Dimensions.height10 * 0.5,
                  ),
                  TTinterfacesText(
                    text: 'Let\'s get you in...',
                    size: Dimensions.font15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(100, 101, 103, 1),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  TextInputBox(
                    hintText: 'Name',
                    controller: _nameController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  TextInputBox(
                    hintText: 'Student E-mail',
                    controller: _studentEmailController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter your student email';
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
                    height: Dimensions.height15,
                  ),
                  SizedBox(
                    height: Dimensions.height110 / 2,
                    child: DropdownButtonFormField<String>(
                      hint: const TTinterfacesText(text: 'Select your school'),
                      iconSize: Dimensions.iconSize16,
                      icon: const Icon(Icons.question_mark),
                      decoration: InputDecoration(
                        hintText: 'Select your school',
                        fillColor: const Color.fromRGBO(240, 240, 240, 1),
                        filled: true,
                        // hintStyle: TextStyle(
                        //   fontFamily: 'TT Interfaces',
                        //   fontSize: Dimensions.font15,
                        //   fontWeight: FontWeight.w400,
                        //   color: const Color.fromRGBO(125, 127, 129, 1),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius7),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Select your school';
                        }
                        return null;
                      },
                      value: selectedSchool,
                      items: dropdownItems,
                      onChanged: (String? school) => setState(
                        () {
                          selectedSchool = school ?? '';
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10 * 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        signUpUser();
                      }
                    },
                    child: Button(
                      content: Center(
                        child: TTinterfacesText(
                          text: 'Sign Up',
                          size: Dimensions.font16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      width: double.infinity,
                    ),
                  ),

                  //! to loginw
                  SizedBox(
                    height: Dimensions.height10 * 2,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'TT Interfaces',
                          fontSize: Dimensions.font10 * 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Log in',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  LoginScreen.routeName,
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

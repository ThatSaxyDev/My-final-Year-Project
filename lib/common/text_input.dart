import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';

class TextInputBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  // final void Function (String?)? onSaved;
  const TextInputBox({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscuretext = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height110 / 2,
      child: TextFormField(
        controller: controller,
        obscureText: obscuretext,
        // onSaved: onSaved,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: const Color.fromRGBO(240, 240, 240, 1),
          filled: true,
          hintStyle: TextStyle(
            fontFamily: 'TT Interfaces',
            fontSize: Dimensions.font15,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(125, 127, 129, 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(Dimensions.radius7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(Dimensions.radius7),
          ),
        ),
        validator: validator,
      ),
    );
  }
}

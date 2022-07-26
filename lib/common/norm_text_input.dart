import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';

class NormInput extends StatelessWidget {
    final String hintText;
  final TextEditingController controller;
  const NormInput({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height110 / 2,
      child: TextField(
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
        // validator: (val) {
        //   if (val == null || val.isEmpty) {
        //     return 'Enter your $hintText';
        //   }
        //   return null;
        // },
      ),
    );
  }
}

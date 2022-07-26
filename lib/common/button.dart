import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';

class Button extends StatelessWidget {
  final Widget content;
  final double width;
  const Button({
    Key? key,
    required this.content,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height110 / 2,
      width: width,
      // margin: EdgeInsets.only(
      //   top: Dimensions.height42,
      //   bottom: Dimensions.height20,
      // ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius7),
          // gradient: const LinearGradient(
          //   colors: [
          //     GlobalVariables.lightOrange,
          //     GlobalVariables.darkOrange,
          //   ],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          color: Colors.purple),
      child: content,
    );
  }
}

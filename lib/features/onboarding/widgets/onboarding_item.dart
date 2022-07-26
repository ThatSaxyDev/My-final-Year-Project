import 'package:flutter/material.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';

class OnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnboardingItem({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.height100 * 4,
            child: Image.asset(image),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          TTinterfacesText(
            text: title,
            size: Dimensions.font15 * 2,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          TTinterfacesText(
            text:
                description,
            maxLines: 4,
            size: Dimensions.font16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

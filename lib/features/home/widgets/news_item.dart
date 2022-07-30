import 'package:flutter/material.dart';

import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/widgets/news_card.dart';

class NewsItem extends StatelessWidget {
  final String image;
  const NewsItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: Dimensions.height10 * 20,
          width: Dimensions.width10 * 20,
          child: NewsCard(image: image)
        ),
        // SizedBox(
        //   height: Dimensions.height10,
        // ),
        TTinterfacesText(
          text: '4 hours ago',
          size: Dimensions.font16,
          color: Colors.grey.withOpacity(0.7),
        ),
      ],
    );
  }
}

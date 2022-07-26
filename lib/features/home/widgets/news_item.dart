import 'package:flutter/material.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/widgets/news_card.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height10 * 14,
          width: Dimensions.width10 * 20,
          child: const NewsCard(
              image:
                  'https://images.unsplash.com/photo-1653149030110-bec7c89bcd93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SizedBox(
          width: Dimensions.width10 * 20,
          child: const TTinterfacesText(
            text:
                'We apologize for the inconvenience caused by the ongoing renovations at various halls of residence - SCHOOL',
            maxLines: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: Dimensions.height10 / 3,
        ),
        TTinterfacesText(
          text: '4 hours ago',
          size: Dimensions.font16,
          color: Colors.grey.withOpacity(0.7),
        ),
      ],
    );
  }
}

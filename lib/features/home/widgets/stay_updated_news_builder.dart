import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/widgets/news_item.dart';

class StayUpdatedNewsBuilder extends StatelessWidget {
  const StayUpdatedNewsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: Dimensions.width20),
          child: const NewsItem(),
        );
      },
    );
  }
}

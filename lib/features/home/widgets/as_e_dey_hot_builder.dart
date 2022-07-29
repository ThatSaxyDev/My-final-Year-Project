import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/services/dummy_models.dart';
import 'package:project_news_restart/features/home/widgets/article_card.dart';
import 'package:project_news_restart/features/home/widgets/image_poster.dart';

class AsEDeyHotBuilder extends StatelessWidget {
  const AsEDeyHotBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: asEDeyHot.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20,
            vertical: Dimensions.height20,
          ),
          child: 
          // asEDeyHot[index]['isArticle'] == true
          //     ? ArticleCard(
          //         image:
          //             asEDeyHot[index]['image'].toString(),
          //         text:
          //             asEDeyHot[index]['text'].toString(),
          //       )
          //     : 
              ImagePosterCard(
                height: Dimensions.height10 * 40,
                  image:
                      'https://images.unsplash.com/photo-1653149030110-bec7c89bcd93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                ),
        );
      },
    );
  }
}

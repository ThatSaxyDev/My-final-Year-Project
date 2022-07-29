import 'package:flutter/material.dart';

import '../../../common/ttinterfaces_text.dart';
import '../../../constants/dimensions.dart';
import 'news_card.dart';

class ArticleCard extends StatelessWidget {
  final String image;
  final String text;
  final String date;
  const ArticleCard({
    Key? key,
    required this.image,
    required this.text,
    this.date = '26/07/2022',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height10 * 15,
      child: PhysicalModel(
        color: Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        child: Container(
          padding: EdgeInsets.all(Dimensions.height20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: Dimensions.width100,
                width: Dimensions.width100,
                child: NewsCard(
                  elevation: 7,
                  image: image,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Dimensions.width10 * 20,
                    child: TTinterfacesText(
                      text: text,
                      maxLines: 3,
                      size: Dimensions.font10 * 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      TTinterfacesText(
                        text: date,
                        maxLines: 1,
                        size: Dimensions.font10 * 1.2,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TTinterfacesText(
                        text: 'Read more',
                        maxLines: 3,
                        size: Dimensions.font10 * 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

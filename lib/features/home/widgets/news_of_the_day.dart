import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';

class NewsOfTheDay extends StatelessWidget {
  const NewsOfTheDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimensions.height10 * 35,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://images.unsplash.com/photo-1653149030110-bec7c89bcd93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              ),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.radius10 * 3),
              bottomRight: Radius.circular(Dimensions.radius10 * 3),
            ),
            color: Colors.blue,
          ),
        ),
        Container(
          height: 10 * 35,
          padding: EdgeInsets.all(Dimensions.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.height10 * 9,
              ),
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius10 * 3),
                      ),
                    ),
                    height: Dimensions.height10 * 4,
                    width: Dimensions.height10 * 15,
                    child: Center(
                      child: TTinterfacesText(
                        text: 'News of the day',
                        color: Colors.white,
                        size: Dimensions.font10 * 1.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              TTinterfacesText(
                text:
                    'We apologize for the inconvenience caused by the ongoing renovations at various halls of residence - SCHOOL',
                maxLines: 3,
                color: Colors.white,
                size: Dimensions.font10 * 3,
                fontWeight: FontWeight.w700,
              ),
              Row(
                children: [
                  TTinterfacesText(
                    text: 'Read More',
                    color: Colors.white,
                    size: Dimensions.font10 * 1.7,
                  ),
                  SizedBox(
                    width: Dimensions.width10 * 0.5,
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/models/upload.dart';

import '../services/home_services.dart';

class NewsOfTheDay extends StatefulWidget {
  const NewsOfTheDay({Key? key}) : super(key: key);

  @override
  State<NewsOfTheDay> createState() => _NewsOfTheDayState();
}

class _NewsOfTheDayState extends State<NewsOfTheDay> {
  ImageUpload? image;
  final HomeServices homeServices = HomeServices();

  // @override
  // void initState() {
  //   super.initState();
  //   fetchAllImages();
  // }

  // fetchAllImages() async {
  //   image = await homeServices.fetchAllImages(context);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimensions.height10 * 35,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/games.jpg',
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
            ],
          ),
        ),
      ],
    );
  }
}

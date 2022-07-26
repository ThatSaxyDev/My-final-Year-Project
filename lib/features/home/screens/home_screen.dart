import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/widgets/news_card.dart';
import 'package:project_news_restart/features/home/widgets/news_of_the_day.dart';
import 'package:project_news_restart/features/home/widgets/stay_updated_news_builder.dart';
import 'package:project_news_restart/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: <Widget>[
                //! news of the day
                const NewsOfTheDay(),

                //! HI, <DISPLAY USERNAME>
                Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height30,
                    bottom: Dimensions.height20,
                  ),
                  child: TTinterfacesText(
                    text: 'Hi, ${user.name}. Stay updated!',
                    size: Dimensions.font10 * 2.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //! STAY UPDATED NEWS
                SizedBox(
                  height: Dimensions.height10 * 23,
                  child: const StayUpdatedNewsBuilder(),
                ),

                //! AS E DEY HOT section
                Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height30,
                  ),
                  child: TTinterfacesText(
                    text: 'As E Dey Hot!',
                    size: Dimensions.font10 * 2.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //!!!
                //! TODO: Create a listview builder that can "randomize" content based on a few logic...
                //! if content has an image or video URL, give this, if it is just text, give that.

                //? test widgets
                //! image poster test
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20,
                  ),
                  child: SizedBox(
                    height: Dimensions.height10 * 40,
                    child: PhysicalModel(
                      color: Colors.grey,
                      elevation: 15,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1653149030110-bec7c89bcd93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),

                //! article test
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20,
                  ),
                  child: SizedBox(
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
                                image:
                                    'https://images.unsplash.com/photo-1653149030110-bec7c89bcd93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dimensions.height10 * 0.6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Dimensions.width10 * 20,
                                    child: TTinterfacesText(
                                      text:
                                          'We apologize for the inconvenience caused by the ongoing renovations at various halls of residence - SCHOOL',
                                      maxLines: 3,
                                      size: Dimensions.font10 * 1.5,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20,
                  ),
                  child: SizedBox(
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
                              child: const NewsCard(
                                elevation: 7,
                                image:
                                    'https://images.unsplash.com/photo-1653149030110-bec7c89bcd93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dimensions.height10 * 0.6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Dimensions.width10 * 20,
                                    child: TTinterfacesText(
                                      text:
                                          'We apologize for the inconvenience caused by the ongoing renovations at various halls of residence - SCHOOL',
                                      maxLines: 3,
                                      size: Dimensions.font10 * 1.5,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20,
                  ),
                  child: SizedBox(
                    height: Dimensions.height10 * 40,
                    child: PhysicalModel(
                      color: Colors.grey,
                      elevation: 15,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1653149030110-bec7c89bcd93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //! floating starred icon
            Positioned(
              right: Dimensions.width10 * 3,
              top: Dimensions.height30,
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius10),
                      ),
                    ),
                    height: Dimensions.height50,
                    width: Dimensions.height50,
                    child: const Center(
                      child: Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

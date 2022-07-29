import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/widgets/article_card.dart';
import 'package:project_news_restart/features/home/widgets/as_e_dey_hot_builder.dart';
import 'package:project_news_restart/features/home/widgets/image_poster.dart';
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
                AsEDeyHotBuilder(),
              ],
            ),

            //! floating starred icon
            Badge(
              position: BadgePosition(
                top: Dimensions.height10 * 1.6,
                end: Dimensions.height10 * 2,
              ),
              elevation: 0,
              badgeContent: TTinterfacesText(text: '2'),
              badgeColor: Colors.white,
              child: Positioned(
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
            ),
          ],
        ),
      ),
    );
  }
}

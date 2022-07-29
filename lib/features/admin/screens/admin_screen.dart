import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/admin/screens/admin_home_screen.dart';
import 'package:project_news_restart/features/admin/screens/gallery_screen.dart';
import 'package:project_news_restart/features/admin/widgets/nav_bar_item.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;

  List<Widget> pagesDisplay = [
    const AdminHomeScreen(),
    const GalleryScreen(),
  ];

  void setPage(int page) {
    _page = page;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height10 * 10,
                  ),

                  //! home icon
                  NavBarItem(
                    onTap: () {
                      setState(() {
                        _page == 0;
                      });
                      setPage(0);
                    },
                    icon: Icon(
                      Icons.home,
                      size: _page == 0
                          ? Dimensions.iconSize10 * 4
                          : Dimensions.iconSize10 * 3.4,
                      color: _page == 0 ? Colors.white : Colors.black,
                    ),
                    color: _page == 0 ? Colors.black : Colors.transparent,
                  ),

                  SizedBox(
                    height: Dimensions.height10 * 7,
                  ),

                  //! gallery icon
                  NavBarItem(
                    onTap: () {
                      setState(() {
                        _page == 1;
                      });
                      setPage(1);
                    },
                    icon: Icon(
                      Icons.browse_gallery,
                      size: _page == 1
                          ? Dimensions.iconSize10 * 4
                          : Dimensions.iconSize10 * 3.4,
                      color: _page == 1 ? Colors.white : Colors.black,
                    ),
                    color: _page == 1 ? Colors.black : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
         SizedBox(
            width: MediaQuery.of(context).size.width * 0.93,
            child: Container(
              color: Colors.grey.withOpacity(0.2),
              child: pagesDisplay[_page],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/screens/home_screen.dart';
import 'package:project_news_restart/features/profile/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/nav-bar';
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  double bottomNavBarWidth = Dimensions.width42;
  double bottomBorderWidth = Dimensions.width10 / 2;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('Settings')),
    const ProfileScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
      body: pages[_page],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius10 * 2),
            topLeft: Radius.circular(Dimensions.radius10 * 2),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 2,
              blurRadius: 12,
            ),
          ],
        ),
        height: Dimensions.height10 * 6.5,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius10 * 2),
            topRight: Radius.circular(Dimensions.radius10 * 2),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _page,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            // backgroundColor: Colors.blue,
            iconSize: Dimensions.font10 * 2.7,
            onTap: updatePage,
            items: [
              //HOME
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 0 ? Icons.home_filled : Icons.home_outlined,
                ),
                label: '',
              ),

              // CART
              const BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: '',
              ),

              // ORDERS
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 2 ? Icons.person : Icons.person_outline,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

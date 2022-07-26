import 'package:flutter/material.dart';
import 'package:project_news_restart/common/button.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/auth/screens/signup_screen.dart';
import 'package:project_news_restart/features/onboarding/widgets/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //! skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(Dimensions.height20),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      SignUpScreen.routeName,
                    );
                  },
                  child: TTinterfacesText(
                    text: 'Skip',
                    textAlign: TextAlign.end,
                    size: Dimensions.font16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            //! onboarding image, title, description
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  OnboardingItem(
                    image: 'assets/images/onboarding1.png',
                    title: 'Get updated',
                    description:
                        'Get updated Get updated Get updated bsgsshsh bah jsjasjasjh jnsajha hksjhshj',
                  ),
                  OnboardingItem(
                    image: 'assets/images/onboarding2.png',
                    title: 'Round the clock',
                    description:
                        'Get updated Get updated Get updated bsgsshsh bah jsjasjasjh jnsajha hksjhshj',
                  ),
                  OnboardingItem(
                    image: 'assets/images/onboarding3.png',
                    title: 'Anywhere. On the go',
                    description:
                        'Get updated Get updated Get updated bsgsshsh bah jsjasjasjh jnsajha hksjhshj',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                  dotHeight: 5, activeDotColor: Colors.purple),
              onDotClicked: (int index) {
                setState(() {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                  page = index;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: GestureDetector(
                onTap: () {
                  if (_controller.page!.toInt() != 2) {
                    setState(() {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                      page++;
                    });
                  } else {
                    Navigator.pushNamed(
                      context,
                      SignUpScreen.routeName,
                    );
                  }
                },
                child: Button(
                  content: Center(
                    child: TTinterfacesText(
                      text: page == 0
                          ? 'NEXT'
                          : page == 1
                              ? 'NEXT'
                              : 'GET STARTED',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

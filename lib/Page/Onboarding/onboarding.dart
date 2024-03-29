import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myhealth/utils/constant.dart';
import 'package:myhealth/utils/size_config.dart';

import '../homebnb.dart';
import 'component/default_button.dart';
import 'component/onboarding_content.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bienvenue sur My health!",
      "image": "assets/application_medicale.png",
    },
    {
      "text":
          "Trouvez facilement un centre de santé \nou un practicien \nen Republique du Congo",
      "image": "assets/hopital.png",
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/report.png",
    },
  ];

  Future<void> savePageVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingVisited', true);
  }

  Future<bool> getPageVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingVisited') ?? false;
  }

  @override
  void initState() {
    super.initState();
    getPageVisited().then((visited) {
      if (visited) {
        navigateToHome();
      }
    });
  }

  void navigateToHome() {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // initialise la fonction SizeConfig
    return FutureBuilder<bool>(
      future: getPageVisited(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          navigateToHome();
          return Container(); // Placeholder widget, not visible
        } else {
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: splashData.length,
                        itemBuilder: (context, index) => OnBoardingContent(
                          text: splashData[index]['text']!,
                          image: splashData[index]['image']!,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                splashData.length,
                                (index) => buildDot(index: index),
                              ),
                            ),
                            const Spacer(flex: 3),
                            DefaultButton(
                              text: 'Continue',
                              press: () {
                                savePageVisited().then((_) {
                                  navigateToHome();
                                });
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  AnimatedContainer buildDot({int index = 0}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

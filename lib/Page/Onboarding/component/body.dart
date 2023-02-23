import 'package:flutter/material.dart';
import 'package:untitle/main_wrapper.dart';
import '../../../utils/constant.dart';
import '../../../utils/size_config.dart';
import '../../home/acceuil.dart';
import 'default_button.dart';
import 'onboarding_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to My health!",
      "image": "assets/application_medicale.png",
    },
    {
      "text": "We help people connect with store \naround Republic of Congo",
      "image": "assets/hopital.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/docteur.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    image: splashData[index]["image"]!),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index)),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      DefaultButton(
                        text: "Continue",
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainWrapper(),
                              ));
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
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

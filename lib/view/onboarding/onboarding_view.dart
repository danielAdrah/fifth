import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme.dart';
import '../bottom_bar/bottom_bar_view.dart';
import '../mainNavBar/main_navbar.dart';
import '../signUp&logIn/sign_in_view.dart';
import '../signUp&logIn/sign_up_view.dart';
import 'onboarding_design.dart';
import 'package:lottie/lottie.dart';
// import '../homePage.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                //that means we are in the last page
                isLastPage = (index == 2);
              });
            },
            itemBuilder: ((context, index) {
              return Container(
                color: TColor.gray.withOpacity(0.1),
                child: Column(children: [
                  const SizedBox(
                    height: 200,
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 500),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Center(
                          child: 
                          SvgPicture.asset(
                            pages[index].image!,
                          ),
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ZoomIn(
                    delay: Duration(milliseconds: 600),
                    child: Text(
                      pages[index].title!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: TColor.white.withOpacity(0.6)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ZoomIn(
                    delay: Duration(milliseconds: 700),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        pages[index].body!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.white.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ]),
              );
            }),
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: isLastPage
                ? Container(
                    width: 240,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.white.withOpacity(0.6))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        "GetStarted",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              color: TColor.white.withOpacity(0.6),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: TColor.white.withOpacity(0.6)),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text("Next",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: TColor.white.withOpacity(0.6))),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

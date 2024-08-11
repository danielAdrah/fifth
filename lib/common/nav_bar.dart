import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class NavBar extends StatefulWidget {
  final String title;
  // final void Function()? onPressed;

  const NavBar({
    super.key,
    required this.title,
    // required this.onPressed,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeInLeft(
          delay: Duration(milliseconds: 200),
          curve: Curves.decelerate,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: TColor.white,
                size: 30,
              )),
        ),
        FadeInDown(
          delay: Duration(milliseconds: 120),
          curve: Curves.decelerate,
          child: Text(
            widget.title,
            style: TextStyle(color: TColor.white, fontSize: 20),
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
  }
}

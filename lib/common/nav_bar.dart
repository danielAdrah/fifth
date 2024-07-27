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
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: TColor.white,
              size: 30,
            )),
        Text(
          widget.title,
          style: TextStyle(color: TColor.white, fontSize: 20),
        ),
        const SizedBox(width: 50),
      ],
    );
  }
}

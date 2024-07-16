import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';
import '../view/settings/settings_view.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              // Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: TColor.gray,
            )),
        FadeInDown(
          delay: Duration(milliseconds: 200),
          curve: Curves.decelerate,
          child: Text(
            title,
            style: TextStyle(
                color: TColor.white.withOpacity(0.6),
                fontSize: media.width * 0.05),
          ),
        ),
        FadeInRight(
          delay: Duration(milliseconds: 200),
          curve: Curves.decelerate,
          child: IconButton(
            onPressed: () {
              Get.to(() => const SettingsView());
            },
            icon: Icon(
              Icons.settings_sharp,
              color: TColor.white.withOpacity(0.6),
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

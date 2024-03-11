import 'package:flutter/material.dart';

import '../theme.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double size;
  final FontWeight fontWeight;

  const SecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.size = 16,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/secodry_btn.png"),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: TColor.white, fontSize: size, fontWeight: fontWeight),
        ),
      ),
    );
  }
}

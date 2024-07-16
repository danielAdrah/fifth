import 'package:flutter/material.dart';

import '../theme.dart';

class DateTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign titleAlign;
  final Widget icon;
  final bool obscureText;
  final VoidCallback onIconPressed;
  void Function()? onTap;
    DateTextField(
      {super.key,
      required this.title,
      required this.onTap,
      this.controller,
      this.titleAlign = TextAlign.left,
      required this.icon,
      this.keyboardType,
      this.obscureText = false,
      required this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: titleAlign,
                style: TextStyle(
                    color: TColor.white.withOpacity(0.4), fontSize: 12),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: TColor.gray60.withOpacity(0.8),
            border: Border.all(color: TColor.gray70),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onTap: onTap,
            readOnly: true,
            style:
                TextStyle(color: TColor.white, decoration: TextDecoration.none),
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: onIconPressed,
                child: icon,
              ),
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

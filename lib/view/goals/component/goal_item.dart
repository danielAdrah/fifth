import 'package:flutter/material.dart';

import '../../../theme.dart';

class GoalItem extends StatelessWidget {
  const GoalItem({
    super.key,
    required this.width,
    required this.title,
    required this.value,
  });

  final double width;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title :",
            style: TextStyle(color: TColor.gray20, fontSize: 20),
          ),
          Text(
            value,
            style:
                TextStyle(color: TColor.gray20.withOpacity(0.6), fontSize: 17),
          ),
        ],
      ),
    );
  }
}

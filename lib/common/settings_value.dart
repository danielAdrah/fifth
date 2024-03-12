import 'package:flutter/material.dart';

import '../theme.dart';

class SettingsValue extends StatelessWidget {
  final String name;
  final IconData icon;
  const SettingsValue({super.key,required this.name,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,
              style: TextStyle(
                color: TColor.white,
              )),
          Icon(
           icon,
            color: TColor.white,
          )
        ],
      ),
    );
  }
}

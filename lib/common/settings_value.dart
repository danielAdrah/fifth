import 'package:flutter/material.dart';

import '../theme.dart';

class SettingsValue extends StatelessWidget {
  final String name;
  final IconData icon;
   Widget? child;
  void Function()? onTap;
    SettingsValue({super.key, required this.name, required this.icon,required this.child,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: TColor.white,
              ),
              const SizedBox(width: 8),
              Text(name,
                  style: TextStyle(
                    color: TColor.white,
                  )),
            ],
            
          ),
          InkWell(
            onTap: onTap,
            child: child,
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../theme.dart';

class AccountTile extends StatelessWidget {
  final String title;
  final String budget;
  final String currency;
  final IconData icon;
  const AccountTile({
    super.key,
    required this.title,
    required this.budget,
    required this.icon, required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.5,
              color: TColor.border.withOpacity(0.8),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(
              icon,
              color: TColor.white,
              size: 30,
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(budget,
                style: TextStyle(color: TColor.border, fontSize: 12)),
                subtitle: Text(budget,
                style: TextStyle(color: TColor.border, fontSize: 10)),
            textColor: TColor.white,
          ),
        ),
      ),
    );
  }
}

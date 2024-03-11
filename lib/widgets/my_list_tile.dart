import 'package:flutter/material.dart';
import '../theme.dart';

class MyListTile extends StatelessWidget {
  final String type;
  final String title;
  final String price;
  final DateTime date;

  const MyListTile({
    super.key,
    required this.type,
    required this.title,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (type) {
      case "Food":
        iconData = Icons.fastfood;
        break;
      case "Drinks":
        iconData = Icons.local_cafe;
        break;
      case "Entertainment":
        iconData = Icons.movie;
        break;
      case "Education":
        iconData = Icons.school;
        break;
      case "Other":
      default:
        iconData = Icons.help_outline;
        break;
    }
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.5,
              color: TColor.border.withOpacity(0.3),
            ),
          ),
          child: ListTile(
            leading: Icon(
              iconData,
              color: TColor.white.withOpacity(0.6),
            ),
            title: Text(title),
            subtitle: Text('${date.day}/${date.month}/${date.year}'),
            trailing: Column(
              children: [
                const SizedBox(height: 10),
                Text(type,
                    style: TextStyle(color: TColor.white.withOpacity(0.6))),
                Text('\$$price',
                    style: TextStyle(color: TColor.white.withOpacity(0.6))),
              ],
            ),
            textColor: TColor.white,
          ),
        ),
      ),
    );
  }
}

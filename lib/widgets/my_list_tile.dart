import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../controller/expense_controller.dart';
import '../theme.dart';

class MyListTile extends StatefulWidget {
  final String type;
  final String title;
  final String price;
  final DateTime date;
  final String img;
  const MyListTile({
    super.key,
    required this.type,
    required this.title,
    required this.price,
    required this.date,
    required this.img,
  });

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  final _controller = Get.put(ExpenseController());
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
              color: TColor.border.withOpacity(0.3),
            ),
          ),
          child: ListTile(
            leading: Icon(
              Icons.fastfood_outlined,
              size: 33,
              color: Colors.white,
            ),
            title: Text(widget.title),
            subtitle: Text(
                '${widget.date.day}/${widget.date.month}/${widget.date.year}'),
            trailing: Column(
              children: [
                const SizedBox(height: 10),
                Text(widget.type,
                    style: TextStyle(color: TColor.white.withOpacity(0.6))),
                Text('\$${widget.price}',
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

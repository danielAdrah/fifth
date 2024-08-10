import 'package:flutter/material.dart';
 
import '../../../theme.dart';
 

class UpcomingTile extends StatefulWidget {
  final String type;
  final String title;
  final String price;
  final DateTime date;
  // final String img;
  const UpcomingTile({
    super.key,
    required this.type,
    required this.title,
    required this.price,
    required this.date,
    // required this.img,
  });

  @override
  State<UpcomingTile> createState() => _UpcomingTileState();
}

class _UpcomingTileState extends State<UpcomingTile> {
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
            // leading: Image(
            //   image: NetworkImage(widget.img),
            //   fit: BoxFit.fill,
            // ),
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

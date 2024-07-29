// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../theme.dart';

class LimitTile extends StatefulWidget {
  final String limitName;
  final String totalAmount;
  final String spendAmount;
  final String remainedAmount;
  final String startDate;
  final String endDate;
  const LimitTile({
    super.key, required this.limitName, required this.totalAmount, required this.spendAmount, required this.remainedAmount, required this.startDate, required this.endDate,
  });

  @override
  State<LimitTile> createState() => _LimitTileState();
}

class _LimitTileState extends State<LimitTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: TColor.gray60.withOpacity(0.6),
          border: Border.all(color: TColor.border.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Icon(
                    Icons.food_bank,
                    size: 35,
                    color: TColor.gray50,
                  )),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.limitName,
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      //the amount you spent
                      " you spend \$${widget.spendAmount}",
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "From ${widget.startDate}",
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //total limit
                    " \$${widget.totalAmount}",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    //how much left
                    "\$${widget.remainedAmount} left to spend",
                    style: TextStyle(
                        color: TColor.gray30,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "To ${widget.endDate}",
                    style: TextStyle(
                        color: TColor.gray30,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          LinearProgressIndicator(
            backgroundColor: TColor.gray60,
            valueColor: AlwaysStoppedAnimation(

              TColor.secondaryG50,
            ),
            minHeight: 3,
            value: 1000,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
  // void updateProgressBasedOnInput(String input) {
  //   setState(() {
  //     // Example: Assume 1000 is the total limit, and input is the current spending
  //     double spending = double.tryParse(input) ?? 0;
  //     progressValue = spending / 1000; // Normalize to 0.0 - 1.0
  //     if (progressValue > 1.0) progressValue = 1.0;
  //     else if (progressValue < 0.0) progressValue = 0.0;
  //   });
  // }
// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';

class LimitTile extends StatelessWidget {
  final String limitName;
  final String totalAmount;
  final String spendAmount;
  final String remainedAmount;
  
  final double progressValue;
  LimitTile({
    super.key,
    required this.limitName,
    required this.totalAmount,
    required this.spendAmount,
    required this.remainedAmount,
      required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: TColor.gray60.withOpacity(0.6),
            border: Border.all(color: TColor.border.withOpacity(0.35)),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: TColor.gray60.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: TColor.border.withOpacity(0.15))),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        "assets/img/budget.png",
                        width: 35,
                        height: 35,
                        color: TColor.gray50,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            limitName,
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "you spend\$${spendAmount}",
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
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
                          " \$${totalAmount}",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " \$${remainedAmount} left to spend",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
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
                  value:  progressValue,
                ),
                const SizedBox(
                  height: 5,
                  
                ),
              ],
            ),
          ),
        )

        //     Column(
        //   // crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Padding(
        //             padding: const EdgeInsets.symmetric(
        //               horizontal: 5,
        //             ),
        //             child: Icon(
        //               Icons.food_bank,
        //               size: 35,
        //               color: TColor.gray50,
        //             )),
        //         const SizedBox(width: 10),
        //         Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               widget.limitName,
        //               style: TextStyle(
        //                   color: TColor.white,
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //             Text(
        //               //the amount you spent
        //               " you spend \$${widget.spendAmount}",
        //               style: TextStyle(
        //                   color: TColor.gray30,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w500),
        //             ),
        //             // Text(
        //             //   "From ${widget.startDate}",
        //             //   style: TextStyle(
        //             //       color: TColor.gray30,
        //             //       fontSize: 13,
        //             //       fontWeight: FontWeight.w600),
        //             // ),
        //           ],
        //         ),
        //         const SizedBox(width: 8),
        //         Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               //total limit
        //               " \$${widget.totalAmount}",
        //               style: TextStyle(
        //                   color: TColor.white,
        //                   fontSize: 13,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //             Text(
        //               //how much left
        //               "\$${widget.remainedAmount} left to spend",
        //               style: TextStyle(
        //                   color: TColor.gray30,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w500),
        //             ),
        //             // Text(
        //             //   "To ${widget.endDate}",
        //             //   style: TextStyle(
        //             //       color: TColor.gray30,
        //             //       fontSize: 14,
        //             //       fontWeight: FontWeight.w600),
        //             // ),
        //           ],
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 5,
        //     ),
        //     LinearProgressIndicator(
        //       backgroundColor: TColor.gray60,
        //       valueColor: AlwaysStoppedAnimation(
        //         TColor.secondaryG50,
        //       ),
        //       minHeight: 3,
        //       value: 1000,
        //     ),
        //     const SizedBox(
        //       height: 5,
        //     ),
        //   ],
        // ),

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
// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';

class GoalCard extends StatefulWidget {
  GoalCard({
    super.key,
    required this.width,
    required this.height,
    required this.goalName,
    required this.current,
    required this.finalBalance,
    required this.date,
    required this.onTap,
  });

  final double width;
  final double height;
  final String goalName;
  final String current;
  final String finalBalance;
  final String date;
  void Function()? onTap;

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 250),
      curve: Curves.decelerate,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: widget.width * 0.05, vertical: widget.height * 0.015),
          width: widget.width,
          height: widget.height * 0.28,
          decoration: BoxDecoration(
            color: TColor.gray70.withOpacity(0.6),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: widget.width * 0.02),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: widget.height * 0.02,
                ),
                Center(
                  child: Text(
                    widget.goalName,
                    style: TextStyle(
                        color: TColor.gray30,
                        fontSize: widget.height * 0.029,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: widget.height * 0.03),
                Padding(
                  padding: EdgeInsets.only(bottom: widget.height * 0.025),
                  child: Row(
                    children: [
                      Text(
                        "Current Balacne  : ",
                        style: TextStyle(
                            fontSize: widget.width * 0.04,
                            color: TColor.gray40.withOpacity(0.9)),
                      ),
                      Text(
                        "\$${widget.current}",
                        style: TextStyle(
                            fontSize: widget.width * 0.037,
                            color: TColor.gray40),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: widget.height * 0.025),
                  child: Row(
                    children: [
                      Text(
                        "Required Balacne  : ",
                        style: TextStyle(
                            fontSize: widget.width * 0.04,
                            color: TColor.gray40),
                      ),
                      Text(
                        "\$${widget.finalBalance}",
                        style: TextStyle(
                            fontSize: widget.width * 0.037,
                            color: TColor.gray40),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: widget.height * 0.025),
                  child: Row(
                    children: [
                      Text(
                        " Dead Line : ",
                        style: TextStyle(
                            fontSize: widget.width * 0.04,
                            color: TColor.gray40),
                      ),
                      Text(
                        widget.date,
                        style: TextStyle(
                            fontSize: widget.width * 0.037,
                            color: TColor.gray40),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

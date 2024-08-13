// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_string_interpolations

import 'package:animate_do/animate_do.dart';
import 'package:fifth/controller/limit_controller.dart';
import 'package:fifth/view/spending_limit/components/update_limit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import 'components/add_limit.dart';
import 'components/limit_detail.dart';
import 'components/limit_tile.dart';

class SpendingLimit extends StatefulWidget {
  const SpendingLimit({super.key});

  @override
  State<SpendingLimit> createState() => _SpendingLimitState();
}

class _SpendingLimitState extends State<SpendingLimit> {
  final controller = Get.put(LimitController());
  @override
  void initState() {
    super.initState();
    controller.displayLimits();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: FadeInDown(
            delay: Duration(milliseconds: 150),
            curve: Curves.decelerate,
            child:
                Text("Spending Limits", style: TextStyle(color: TColor.white))),
        actions: [
          FadeInRight(
            delay: Duration(milliseconds: 150),
            curve: Curves.decelerate,
            child: IconButton(
              onPressed: () {
                Get.to(CreateLimit());
              },
              icon: Icon(
                Icons.add,
                color: TColor.white,
                size: 33,
              ),
            ),
          ),
        ],
        leading: FadeInLeft(
          delay: Duration(milliseconds: 150),
          curve: Curves.decelerate,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: TColor.white,
              size: 25,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Obx(
        () => controller.limitLoading.value
            ? SpinKitSpinningLines(
                color: TColor.primary,
                size: 40,
              )
            : controller.limitsList.isEmpty
                ? ZoomIn(
                    delay: Duration(milliseconds: 100),
                    curve: Curves.decelerate,
                    child: Center(
                      child: Text("No limits yet \n Please add a limit first",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.limitsList.length,
                      itemBuilder: ((context, index) {
                        var lm = controller.limitsList[index];
                        return Slidable(
                          endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.deleteLimit(lm.id);
                                  },
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                  spacing: 2,
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    Get.to(UpdateLimit(id: lm.id));
                                  },
                                  icon: Icons.edit,
                                  backgroundColor: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                  spacing: 2,
                                ),
                              ]),
                          child: FadeInUp(
                            delay: Duration(milliseconds: 150),
                            curve: Curves.decelerate,
                            child: InkWell(
                              onTap: () {
                                Get.to(LimitDetail());
                                controller.fetchLimit(lm.id);
                              },
                              child: LimitTile(
                                limitName: "${lm.categoryName}",
                                totalAmount: "${lm.limit}",
                                spendAmount: "${lm.currentSpending}",
                                remainedAmount: "${lm.remainingAmount}",
                                progressValue:
                                    (lm.currentSpending / lm.limit) * 100,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
      )),
    );
  }
}

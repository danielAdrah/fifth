// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:animate_do/animate_do.dart';
import 'package:fifth/controller/upcoming_controller.dart';
import 'package:fifth/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../common/custome_app_bar.dart';
import '../../theme.dart';
import 'components/upcoming_tile.dart';
import 'components/update_upcoming.dart';

class UpcomingExpense extends StatefulWidget {
  const UpcomingExpense({super.key});

  @override
  State<UpcomingExpense> createState() => _UpcomingExpenseState();
}

class _UpcomingExpenseState extends State<UpcomingExpense> {
  final controller = Get.put(UpcomingController());
  @override
  void initState() {
    super.initState();
    controller.fetchUpcomingExpenses();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomeAppBar(title: "Upcoming Expenses"),
              SizedBox(height: height * 0.07),
              SizedBox(
                  height: height,
                  child: Obx(
                    () => controller.upcomingLoading.value
                        ? SpinKitSpinningLines(
                            color: TColor.primary,
                            size: 40,
                          )
                        : controller.upcomingList.isEmpty
                            ? Center(
                                child: Text(
                                    "No Upcoming expense \n plesae add one first",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: TColor.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)))
                            : ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.upcomingList.length,
                                itemBuilder: ((context, index) {
                                  var up = controller.upcomingList[index];
                                  return FadeInDown(
                                    delay: Duration(milliseconds: 100),
                                    curve: Curves.decelerate,
                                    child: Slidable(
                                      endActionPane: ActionPane(
                                          motion: const StretchMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {
                                                controller
                                                    .deleteUpcoming(up.id);
                                              },
                                              icon: Icons.delete,
                                              backgroundColor: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              spacing: 2,
                                            ),
                                            SlidableAction(
                                              onPressed: (context) {
                                                Get.to(
                                                    UpdateUpcoming(id: up.id));
                                              },
                                              icon: Icons.edit,
                                              backgroundColor: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              spacing: 2,
                                            ),
                                          ]),
                                      child: InkWell(
                                        onTap: () {
                                          controller.fetchUpcomingExpenses();
                                        },
                                        child: UpcomingTile(
                                            // img: "",
                                            type: "food",
                                            title: "${up.name}",
                                            price: "\$${up.price}",
                                            date: up.date),
                                      ),
                                    ),
                                  );
                                })),
                  )),
              // SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

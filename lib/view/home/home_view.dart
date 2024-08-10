// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_string_interpolations

import 'package:animate_do/animate_do.dart';
import 'package:fifth/model/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../controller/expense_controller.dart';
import '../../theme.dart';
// import '../add_expenses/add_expense_view.dart';
import 'package:get/get.dart';
import '../../widgets/my_list_tile.dart';
import '../settings/settings_view.dart';
import '../../widgets/my_pie_chart.dart';
import '../update_expense/update_expense.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(ExpenseController());
  @override
  void initState() {
    controller.displayExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: ListView(children: [
        SafeArea(
          child: Column(
            children: [
              Container(
                height: media.width * 1,
                decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                //here will be the piechart
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: media.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              // controller.displayExpense();
                              Get.to(() => const SettingsView());
                            },
                            icon: Icon(
                              Icons.settings_sharp,
                              color: TColor.white.withOpacity(0.6),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 5),
                    Center(
                        child: Text("Expenses",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: media.width * 0.05,
                                fontWeight: FontWeight.w700))),
                    SizedBox(height: media.width * 0.04),
                    Container(
                        // height: media.width * 0.9,
                        child: Center(child: MyPieChart())),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => controller.expenses.isEmpty
                    ? Center(
                        child: Text(
                        "No Expenses Added Yet \n Please Add An Expense First",
                        style: TextStyle(
                            color: TColor.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.expenses.length,
                        itemBuilder: ((context, index) {
                          var data = controller.expenses[index];
                          return FadeInDown(
                            delay: Duration(milliseconds: 500),
                            curve: Curves.decelerate,
                            child: Slidable(
                              endActionPane: ActionPane(
                                  motion: const StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        controller.deleteExpense(data.id);
                                      },
                                      icon: Icons.delete,
                                      backgroundColor: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                      spacing: 2,
                                    ),
                                    SlidableAction(
                                      onPressed: (context) {
                                        Get.to(UpdateExpense(id: data.id));
                                      },
                                      icon: Icons.edit,
                                      backgroundColor: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                      spacing: 2,
                                    ),
                                  ]),
                              child: MyListTile(
                                  img: "${data.categoryIcon}",
                                  type: "${data.subcategoryName ?? 'Unkown'}",
                                  title: "${data.itemName}",
                                  price: "${data.price}",
                                  date: data.created),
                            ),
                          );
                        }),
                      ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ]),
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../theme.dart';
import '../add_expenses/add_expense_view.dart';
import '../charts_view/chart_view.dart';
import '../goals/component/create_goal.dart';
import '../goals/goals_view.dart';
import '../home/home_view.dart';
import '../incoming_expenses/components/create_income.dart';
import '../incoming_expenses/incoming_expense_view.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  List<Widget> screens = [
    HomeView(),
    ChartView(),
    Container(
      child: Center(
        child: Text("2"),
      ),
    ),
    Container(
      child: Center(
        child: Text("3"),
      ),
    ),
  ];
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: PageStorage(
        bucket: pageStorageBucket,
        child: currentTabView,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {
          //here we will add the addExpense screen

          _showDialoge(context);
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/center_btn.png"))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: TColor.gray70,
        elevation: 0.5,
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(
          // color: TColor.gray40,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectTab = 0;
                    currentTabView = const HomeView();
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 25,
                      color: selectTab == 0 ? TColor.white : TColor.gray30,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 13,
                          color: selectTab == 0 ? TColor.white : TColor.gray30),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectTab = 1;
                    currentTabView = ChartView();
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bar_chart,
                      size: 24,
                      color: selectTab == 1 ? TColor.white : TColor.gray30,
                    ),
                    Text(
                      "Chart",
                      style: TextStyle(
                          fontSize: 13,
                          color: selectTab == 1 ? TColor.white : TColor.gray30),
                    ),
                  ],
                ),
              ),
              SizedBox(width: width * 0.02),
              InkWell(
                onTap: () {
                  setState(() {
                    selectTab = 2;
                    currentTabView = GoalView();
                    // Container(
                    //   child: Center(
                    //     child: Text("2"),
                    //   ),
                    // );
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.square_favorites,
                      size: 24,
                      color: selectTab == 2 ? TColor.white : TColor.gray30,
                    ),
                    Text(
                      "Goals",
                      style: TextStyle(
                          fontSize: 13,
                          color: selectTab == 2 ? TColor.white : TColor.gray30),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectTab = 3;
                    currentTabView = IcomingExpenses();
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.timer,
                      color: selectTab == 3 ? TColor.white : TColor.gray30,
                    ),
                    Text(
                      "Icoming",
                      style: TextStyle(
                          fontSize: 13,
                          color: selectTab == 3 ? TColor.white : TColor.gray30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_showDialoge(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        return AlertDialog(
          elevation: 5,
          shadowColor: TColor.border,
          backgroundColor: TColor.gray70,
          content: Container(
            // padding: EdgeInsets.all(5),
            width: width * 0.67,
            height: height * 0.35,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    List<String> images = [
                      "assets/img/budget.png",
                      "assets/img/piggy-bank.png",
                      "assets/img/asset-management.png",
                    ];
                    List<String> titles = [
                      "Create Expense",
                      "Create\nGoal",
                      "Create Incoming",
                    ];
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Get.to(() => const AddExpenseView());
                        }
                        if (index == 1) {
                          Get.to(() => const CreateGoal());
                        }
                        if (index == 2) {
                          Get.to(() => const CreateIncome());
                        }
                      
                      },
                      child: ZoomIn(
                        delay: const Duration(milliseconds: 50),
                        curve: Curves.decelerate,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: TColor.border),
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(images[index], width: 60, height: 60),
                              Text(
                                titles[index],
                                style: TextStyle(
                                    color: TColor.white, fontSize: 15),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            ),
          ),
        );
      });
}

// Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.to(AddExpenseView());
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: TColor.border),
//                         borderRadius: BorderRadius.circular(25)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(height: 10),
//                         Image.asset("assets/img/budget.png",
//                             width: 80, height: 80),
//                         Text(
//                           "Create\n Expense",
//                           style: TextStyle(color: TColor.white, fontSize: 20),
//                           textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 30),
//                 InkWell(
//                   onTap: () {
//                     Get.to(CreateGoal());
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: TColor.border),
//                         borderRadius: BorderRadius.circular(25)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.asset("assets/img/piggy-bank.png",
//                             width: 80, height: 80),
//                         Text(
//                           "Create\n Goal",
//                           style: TextStyle(color: TColor.white, fontSize: 20),
//                           textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
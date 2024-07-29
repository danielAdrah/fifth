// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable

import 'package:animate_do/animate_do.dart';
import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../common/fali_alert.dart';
import '../../theme.dart';
import '../add_expenses/add_expense_view.dart';
import '../add_expenses/choose_main_category.dart';
import '../charts_view/chart_view.dart';
import '../goals/component/create_goal.dart';
import '../goals/goals_view.dart';
import '../home/home_view.dart';
import '../incoming_expenses/components/create_income.dart';
import '../incoming_expenses/incoming_expense_view.dart';

import '../spending_limit/spending_limit_view.dart';

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
          // _showawesome(context);
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
                    AnimateIcon(
                      onTap: () {
                        setState(() {
                          selectTab = 0;
                          currentTabView = const HomeView();
                        });
                      },
                      iconType: IconType.animatedOnTap,
                      height: 25,
                      width: 25,
                      color: selectTab == 0 ? TColor.white : TColor.gray30,
                      animateIcon: AnimateIcons.home,
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
                    currentTabView = const ChartView();
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimateIcon(
                      onTap: () {
                        setState(() {
                          selectTab = 1;
                          currentTabView = const ChartView();
                        });
                      },
                      iconType: IconType.animatedOnTap,
                      height: 25,
                      width: 25,
                      color: selectTab == 1 ? TColor.white : TColor.gray30,
                      animateIcon: AnimateIcons.activity,
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
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimateIcon(
                      onTap: () {
                        setState(() {
                          selectTab = 2;
                          currentTabView = GoalView();
                        });
                      },
                      iconType: IconType.animatedOnTap,
                      height: 25,
                      width: 25,
                      color: selectTab == 2 ? TColor.white : TColor.gray30,
                      animateIcon: AnimateIcons.list,
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
                    AnimateIcon(
                      onTap: () {
                        setState(() {
                          selectTab = 3;
                          currentTabView = IcomingExpenses();
                        });
                      },
                      iconType: IconType.animatedOnTap,
                      height: 25,
                      width: 25,
                      color: selectTab == 3 ? TColor.white : TColor.gray30,
                      animateIcon: AnimateIcons.hourglass,
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

_showawesome(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible:
        true, // Set to false if you want the dialog to not close when tapping outside
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      return ZoomIn(
        delay: Duration(milliseconds: 150),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FailAlert(width: width, height: height),
      );
    },
  );
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
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    List<String> images = [
                      "assets/img/budget.png",
                      "assets/img/piggy-bank.png",
                      "assets/img/asset-management.png",
                      "assets/img/financial-profit (1).png",
                    ];
                    List<String> titles = [
                      "Create Expense",
                      "Create\nGoal",
                      "Create Incoming",
                      "Spending\nLimit"
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
                        if (index == 3) {
                          Get.to(() => const SpendingLimit());
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

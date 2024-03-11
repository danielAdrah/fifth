import 'package:flutter/material.dart';

import '../../theme.dart';
import '../add_expenses/add_expense_view.dart';
import '../home/home_view.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        children: [
          PageStorage(
            bucket: pageStorageBucket,
            child: currentTabView,
          ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      Image.asset("assets/img/bottom_bar_bg.png"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectTab = 0;
                                currentTabView = const HomeView();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => HomeView()));
                              });
                            },
                            icon: Icon(
                              Icons.home,
                              size: 30,
                              color:
                                  selectTab == 0 ? TColor.white : TColor.gray30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectTab = 1;
                                currentTabView = Container();
                              });
                            },
                            icon: Icon(
                              Icons.bar_chart_sharp,
                              size: 30,
                              color:
                                  selectTab == 1 ? TColor.white : TColor.gray30,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                            height: 50,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectTab = 2;
                                currentTabView = Container();
                              });
                            },
                            icon: Icon(
                              Icons.note,
                              size: 30,
                              color:
                                  selectTab == 2 ? TColor.white : TColor.gray30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectTab = 3;
                                currentTabView = Container();
                              });
                            },
                            icon: Icon(
                              Icons.abc,
                              size: 30,
                              color:
                                  selectTab == 3 ? TColor.white : TColor.gray30,
                            ),
                          ),
                        ],
                      ),
                    ]),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddExpenseView()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: TColor.secondary.withOpacity(0.5),
                              blurRadius: 5,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          "assets/img/center_btn.png",
                          width: 55,
                          height: 55,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

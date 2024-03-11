import 'package:fifth/model/expense_data.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';
import '../add_expenses/add_expense_view.dart';
import 'package:get/get.dart';
import '../../widgets/my_list_tile.dart';
import '../settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                height: media.width * 1.1,
                decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                //here will be the piechart
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(()=>const SettingsView());
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GetBuilder<ExpenseData>(
                init: ExpenseData(),
                builder: (controller) {
                  if (controller.getAllexpense().isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Center(
                        child: Text(
                          "No expenses added yet.\nTap the + button to add a new expense.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: TColor.gray30),
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.getAllexpense().length,
                        itemBuilder: ((context, index) {
                          var expense = controller.getAllexpense()[index];
                          return MyListTile(
                              type: expense.type,
                              title: expense.name,
                              price: expense.price,
                              date: expense.date);
                        }));
                  }
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}

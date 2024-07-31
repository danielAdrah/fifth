// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:fifth/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../common/custome_app_bar.dart';
import '../../theme.dart';

class IcomingExpenses extends StatefulWidget {
  const IcomingExpenses({super.key});

  @override
  State<IcomingExpenses> createState() => _IcomingExpensesState();
}

class _IcomingExpensesState extends State<IcomingExpenses> {
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
              CustomeAppBar(title: "Icoming Expenses"),
              SizedBox(height: height * 0.07),
              SizedBox(
                height: height,
                child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return FadeInDown(
                        delay: Duration(milliseconds: 100),
                        curve: Curves.decelerate,
                        child: Slidable(
                          endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    // controller.deleteExpense(data.id);
                                  },
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                  spacing: 2,
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    // Get.to(UpdateExpense(id: data.id));
                                  },
                                  icon: Icons.edit,
                                  backgroundColor: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                  spacing: 2,
                                ),
                              ]),
                          child: MyListTile(
                              img: "",
                              type: "Food",
                              title: "Chicken",
                              price: "\$950",
                              date: DateTime.now()),
                        ),
                      );
                    })),
              ),
              // SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

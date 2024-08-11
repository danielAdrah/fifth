// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_string_interpolations

import 'package:animate_do/animate_do.dart';
import 'package:fifth/view/accounts/account_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../controller/expense_controller.dart';
import '../../theme.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

class _AccountsViewState extends State<AccountsView> {
  final controller = Get.put(ExpenseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: TColor.white),
        centerTitle: true,
        title: FadeInDown(
          delay: Duration(milliseconds: 200),
          curve: Curves.decelerate,
          child: Text('My Accounts',
              style: TextStyle(color: TColor.white, fontSize: 22)),
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.myAccounts.length,
                    itemBuilder: (context, index) {
                      var acc = controller.myAccounts[index];
                      return Slidable(
                        endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  controller.deleteAccount(acc.id);
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                                spacing: 2,
                              ),
                            ]),
                        child: FadeInUp(
                          delay: Duration(milliseconds: 200),
                          curve: Curves.decelerate,
                          child: AccountTile(
                            icon: Icons.account_box,
                            currency: "${acc.currency}",
                            title: "${acc.name}",
                            budget: "${acc.budget}",
                          ),
                        ),
                      );
                    }),
              ))),
    );
  }
}

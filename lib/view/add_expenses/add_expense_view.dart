import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/expense_data.dart';
import '../../model/expense_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../theme.dart';
import '../../common/rounded_textField.dart';
import '../../common/primary_button.dart';
import'../../widgets/typeDropdownSearch.dart';

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  ExpenseData exp = Get.put(ExpenseData());
  TextEditingController nameController = TextEditingController();
  TextEditingController valController = TextEditingController();
  DateTime date = DateTime.now();
  List<String> items = [
    "Food",
    "Drinks",
    "Entertainment",
    "Education",
    "Other"
  ];
  void clearField() {
    nameController.clear();
    valController.clear();
  }

  void save() {
    if (nameController.text.isNotEmpty && valController.text.isNotEmpty) {
      ExpenseModel newExpense = ExpenseModel(
          type: exp.selectedType,
          name: nameController.text,
          price: valController.text,
          date: DateTime.now());
      Get.find<ExpenseData>().addExpense(newExpense);
      clearField();
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray.withOpacity(0.9),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const SizedBox(height: 10),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: TColor.white,
                      size: 30,
                    )),
                Text(
                  "Add Expense",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none),
                ),
                Icon(
                  Icons.spellcheck_rounded,
                  color: TColor.gray70.withOpacity(0.7),
                ),
              ],
            ),
            Stack(alignment: Alignment.center, children: [
              // const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 700,
                  decoration: BoxDecoration(
                      color: TColor.gray70.withOpacity(1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: TypeDropDown(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: RoundedTextField(
                          title: "Name",
                          controller: nameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: RoundedTextField(
                          title: "Price",
                          controller: valController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: PrimaryButton(
                            title: "Add",
                            onPressed: () {
                              save();
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

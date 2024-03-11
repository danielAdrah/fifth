import 'expense_model.dart';
import 'package:get/get.dart';

class ExpenseData extends GetxController {
  //list of the expenses that the user add
  List<ExpenseModel> allExpenses = [];

  //get all the expenses
  List<ExpenseModel> getAllexpense() {
    return allExpenses;
  }

//add the expense to the list to display
  void addExpense(ExpenseModel exp) {
    allExpenses.add(exp);
    update();
  }

  //remove the expense from the list
  void removeExpense(ExpenseModel exp) {
    allExpenses.remove(exp);
    update();
  }

  String selectedType = '';
   void updateSelectedExpenseType(String value) {
    selectedType = value;
    update();
 }

}

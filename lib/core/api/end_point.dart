class EndPoint {
  static String baseUrl = "https://85.31.237.33:9000/project/";
  static String logIn = "auth/log-in/";
  static String signUp = "auth/sign-up/";
  static String createItem = "charts/create-item/";
  static String deleteItem(id) {
    return "charts/ret-upd-des-item/$id/";
  }

  static String updateExpense(id) {
    return "charts/ret-upd-des-item/$id/";
  }

  static String listItems = "charts/create-item/";
}

class ApiKeys {
  static String auth = "Authorization";
  static String tokens = "tokens";
  //==========
  static String username = "username";
  static String email = "email";
  static String password = "password";
  static String confpassword = "confpassword";
  static String name = "name";
  //===========
  static String itemName = "item_name";
  static String quantity = "quantity";
  static String price = "price";
  static String expenseType = "expense_type";
  //===========
}

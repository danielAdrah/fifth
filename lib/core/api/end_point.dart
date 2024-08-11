class EndPoint {
  static String baseUrl = "http://85.31.237.33/project/";
  static String logIn = "auth/log-in/";
  static String signUp = "auth/sign-up/";
  static String createItem = "charts/create-item/";
  static String categories = "charts/categories";
  static String subCategories = "charts/subcategories";
  static String createLimit = "charts/create-limit/";
  static String showLimits = "charts/list-limits";
  static String createAccount = "create-account/";
  static String myAccounts = "accounts/";
  static String profileInfo(id) {
    return "setting/profile-info/$id";
  }

  static String myItems(id) {
    return "charts/items/$id";
  }

  static String deleteLimit(id) {
    return "charts/delete-limit/$id";
  }

  static String updateLimit(id) {
    return "charts/update-limit/$id";
  }

  static String deleteItem(id) {
    return "charts/delete-item/$id/";
  }

  static String updateExpense(id) {
    return "charts/update-item/$id/";
  }

  static String fetchLimit(id) {
    return "charts/get-limit/$id";
  }

  static String deleteUpcoming(id) {
    return "charts/delete-upcoming/$id";
  }

  static String updateUpcoming(id) {
    return "charts/update-upcoming/$id";
  }

  static String deleteAccount(id) {
    return "delete-account/$id";
  }

  static String listItems = "charts/create-item/";
  static String upcomingList = "charts/list-upcoming";
  static String createUpcoming = "charts/create-upcoming/";
}

class ApiKeys {
  static String auth = "Authorization";
  static String tokens = "tokens";
  //==========
  static String username = "username";
  static String email = "email";
  static String password = "password";
  static String confpassword = "confirm_password";
  static String name = "name";
  static String currency = "currency";
  static String budget = "budget";
  static String notes = "notes";
  //===========
  static String itemName = "item_name";
  static String quantity = "quantity";
  static String price = "price";
  static String expenseType = "expense_type";
  static String account = "account";
  static String subcategory = "subcategory";
  static String category_name = "category_name";
  static String date = "date";
  //===========
  static String user = "user";
  static String startDate = "start_date";
  static String endDate = "end_date";
  static String limit = "limit";
  static String category = "category";
}

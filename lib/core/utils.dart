import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/expense/models/expense.dart';

bool onboarding = true;
String userName = '';
String userCurrency = '\$';
int userExpense = 0;
int userIncome = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  userName = prefs.getString('userName') ?? 'User';
  userCurrency = prefs.getString('userCurrency') ?? '\$';
  userExpense = prefs.getInt('userExpense') ?? 0;
  userIncome = prefs.getInt('userIncome') ?? 0;

  log(onboarding.toString());
  log(userName);
  log(userCurrency);
  log(userExpense.toString());
  log(userIncome.toString());
}

Future<void> saveUser(String name, String currency) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userName', name);
  prefs.setString('userCurrency', currency);
  prefs.setBool('onboarding', false);
  await getData();
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

void getExpenses(List<Expense> expenses) {
  int expense = 0;
  int income = 0;
  for (Expense e in expenses) {
    if (e.expense) {
      expense = expense + e.amount;
    } else {
      income = income + e.amount;
    }
  }
  log(expense.toString());
  log(income.toString());
  userExpense = expense;
  userIncome = income;
  log('userExpense = $userExpense');
  log('userIncome = $userIncome');
}

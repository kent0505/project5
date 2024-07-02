import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/expense/models/expense.dart';

bool onboarding = true;
String userName = '';
String userCurrency = '\$';
int userExpense = 0;
int userIncome = 0;

List<Expense> expensesList = [];
int totalDayExpenses = 0;
int totalDayIncomes = 0;
int dayExpensesHeight = 0;
int dayIncomesHeight = 0;

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

String getCurrentWeekDay() {
  DateTime now = DateTime.now();
  int currentWeekday = now.weekday;
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  String currentWeekdayName = weekdays[currentWeekday - 1];
  return currentWeekdayName;
}

void getDayExpenses() {
  totalDayExpenses = 0;
  totalDayIncomes = 0;
  List<Expense> currentDayExpenses = [];
  for (Expense expense in expensesList) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(expense.id * 1000);
    if (date.day == DateTime.now().day) {
      currentDayExpenses.add(expense);
    }
  }
  for (Expense expense in currentDayExpenses) {
    if (expense.expense) {
      totalDayExpenses = totalDayExpenses + expense.amount;
    } else {
      totalDayIncomes = totalDayIncomes + expense.amount;
    }
  }
}

double getDayExpensesHeight() {
  getDayExpenses();
  if (totalDayExpenses == 0) return 7;
  if (totalDayIncomes == 0) return 100 + 40;
  double percent = (totalDayIncomes / totalDayExpenses) * 100 + 40;
  return percent;
}

double getDayIncomesHeight() {
  getDayExpenses();
  if (totalDayExpenses == 0) return 100 + 40;
  if (totalDayIncomes == 0) return 7;
  double percent = (totalDayExpenses / totalDayIncomes) * 100 + 40;
  return percent;
}

void getExpenses(List<Expense> expenses) {
  int expense = 0;
  int income = 0;
  expensesList = [];
  for (Expense e in expenses) {
    if (e.expense) {
      expense = expense + e.amount;
    } else {
      income = income + e.amount;
    }
    expensesList.add(e);
  }
  log(expense.toString());
  log(income.toString());
  userExpense = expense;
  userIncome = income;
  log('userExpense = $userExpense');
  log('userIncome = $userIncome');
}

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

bool onboarding = true;
String userName = '';
String userCurrency = '\$';
int userExpence = 0;
int userIncome = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  userName = prefs.getString('userName') ?? 'User';
  userCurrency = prefs.getString('userCurrency') ?? '\$';
  userExpence = prefs.getInt('userExpence') ?? 4000;
  userIncome = prefs.getInt('userIncome') ?? 5000;

  log(onboarding.toString());
  log(userName);
  log(userCurrency);
  log(userExpence.toString());
  log(userIncome.toString());
}

Future<void> saveUser(String name, String currency) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userName', name);
  prefs.setString('userCurrency', currency);
  prefs.setBool('onboarding', false);
}

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

bool onboarding = true;
String userName = '';
String userCurrency = '\$';

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  userName = prefs.getString('userName') ?? 'User';
  userCurrency = prefs.getString('userCurrency') ?? '\$';

  log(onboarding.toString());
  log(userName);
  log(userCurrency);
}

Future<void> saveUser(String name, String currency) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userName', name);
  prefs.setString('userCurrency', currency);
  prefs.setBool('onboarding', false);
}

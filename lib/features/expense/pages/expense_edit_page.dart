import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../models/expense.dart';

class ExpenseEditPage extends StatefulWidget {
  const ExpenseEditPage({super.key, required this.expense});

  final Expense expense;

  @override
  State<ExpenseEditPage> createState() => _ExpenseEditPageState();
}

class _ExpenseEditPageState extends State<ExpenseEditPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}

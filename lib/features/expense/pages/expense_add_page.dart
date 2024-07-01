import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class ExpenseAddPage extends StatefulWidget {
  const ExpenseAddPage({super.key, required this.expense});

  final bool expense;

  @override
  State<ExpenseAddPage> createState() => _ExpenseAddPageState();
}

class _ExpenseAddPageState extends State<ExpenseAddPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.expense ? 'Add Expense' : 'Add Income',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

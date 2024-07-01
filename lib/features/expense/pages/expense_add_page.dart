import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/expense_bloc.dart';
import '../models/expense.dart';

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
                PrimaryButton(
                  title: 'Add test',
                  onPressed: () {
                    context.read<ExpenseBloc>().add(
                          AddExpenseEvent(
                            expense: Expense(
                              id: getCurrentTimestamp(),
                              target: 'Buy a car',
                              amount: 20000,
                              category: 'Vehicle',
                              expense: true,
                            ),
                          ),
                        );
                    context.pop();
                  },
                ),
                PrimaryButton(
                  title: 'Delete test',
                  onPressed: () {
                    context.read<ExpenseBloc>().add(
                          DeleteExpenseEvent(id: 1719855205),
                        );
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

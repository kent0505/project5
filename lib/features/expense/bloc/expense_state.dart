part of 'expense_bloc.dart';

abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpensesLoadedState extends ExpenseState {
  final List<Expense> expenses;
  final int balance;
  ExpensesLoadedState({
    required this.expenses,
    required this.balance,
  });
}

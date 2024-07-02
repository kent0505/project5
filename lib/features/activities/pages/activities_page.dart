import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom/custom_scaffold.dart';
import '../../../core/widgets/page_title.dart';
import '../../expense/bloc/expense_bloc.dart';
import '../widgets/bar_chart.dart';
import '../widgets/income_info_card.dart';
import '../widgets/period_card.dart';
import '../widgets/total_card.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final controller = TextEditingController();

  int income = userIncome;
  int expense = userExpense;
  int total = userIncome + userExpense;

  void getDayData() {}

  void onChanged() {
    log(controller.text);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller.text = 'Day';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 17,
              ),
              children: [
                const PageTitle('Activities'),
                Row(
                  children: [
                    Text(
                      'Timetable',
                      style: TextStyle(
                        color: AppColors.white50,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                BlocBuilder<ExpenseBloc, ExpenseState>(
                  builder: (context, state) {
                    return Container(
                      height: 202,
                      width:
                          MediaQuery.of(context).size.width > 400 ? 400 : null,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (controller.text == 'Day') ...[
                            BarChartCard(
                              title: getCurrentWeekDay(),
                              incomeHeight: getHeight(dayIncomes),
                              expenseHeight: getHeight(dayExpenses),
                            ),
                          ],
                          if (controller.text == 'Week') ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                BarChartCard(
                                  title: 'Mon',
                                  incomeHeight: getHeight(w1Incomes),
                                  expenseHeight: getHeight(w1Expenses),
                                ),
                                BarChartCard(
                                  title: 'Tue',
                                  incomeHeight: getHeight(w2Incomes),
                                  expenseHeight: getHeight(w2Expenses),
                                ),
                                BarChartCard(
                                  title: 'Wed',
                                  incomeHeight: getHeight(w3Incomes),
                                  expenseHeight: getHeight(w3Expenses),
                                ),
                                BarChartCard(
                                  title: 'Thu',
                                  incomeHeight: getHeight(w4Incomes),
                                  expenseHeight: getHeight(w4Expenses),
                                ),
                                BarChartCard(
                                  title: 'Fri',
                                  incomeHeight: getHeight(w5Incomes),
                                  expenseHeight: getHeight(w5Expenses),
                                ),
                                BarChartCard(
                                  title: 'Sat',
                                  incomeHeight: getHeight(w6Incomes),
                                  expenseHeight: getHeight(w6Expenses),
                                ),
                                BarChartCard(
                                  title: 'Sun',
                                  incomeHeight: getHeight(w7Incomes),
                                  expenseHeight: getHeight(w7Expenses),
                                ),
                              ],
                            ),
                          ],
                          if (controller.text == 'Month') ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                BarChartCard(
                                  title: 'w 1',
                                  incomeHeight: getHeight(m1Incomes),
                                  expenseHeight: getHeight(m1Expenses),
                                ),
                                BarChartCard(
                                  title: 'w 2',
                                  incomeHeight: getHeight(m2Incomes),
                                  expenseHeight: getHeight(m2Expenses),
                                ),
                                BarChartCard(
                                  title: 'w 3',
                                  incomeHeight: getHeight(m3Incomes),
                                  expenseHeight: getHeight(m3Expenses),
                                ),
                                BarChartCard(
                                  title: 'w 4',
                                  incomeHeight: getHeight(m4Incomes),
                                  expenseHeight: getHeight(m4Expenses),
                                ),
                              ],
                            ),
                          ],
                          if (controller.text == 'Year') ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                BarChartCard(
                                  title: 'y 1',
                                  incomeHeight: getHeight(y1Incomes),
                                  expenseHeight: getHeight(y1Expenses),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 18),
                PeriodCard(
                  controller: controller,
                  onChanged: onChanged,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Cash ($userCurrency)',
                      style: TextStyle(
                        color: AppColors.white50,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const IncomeInfoCard(income: true),
                const SizedBox(height: 8),
                const IncomeInfoCard(income: false),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Total amount ($userCurrency)',
                      style: TextStyle(
                        color: AppColors.white50,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const TotalCard(),
              ],
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom/custom_scaffold.dart';
import '../../../core/widgets/page_title.dart';
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
                Container(
                  height: 202,
                  width: MediaQuery.of(context).size.width > 400 ? 400 : null,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    children: [
                      // BarChart(
                      //   BarChartData(
                      //     maxY: 200,
                      //     minY: 0,
                      //   ),
                      // ),
                    ],
                  ),
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

import 'package:flutter/material.dart';
import 'package:project5/features/activities/widgets/income_info_card.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom/custom_scaffold.dart';
import '../../../core/widgets/page_title.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            const SizedBox(height: 17),
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
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 17),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width > 400 ? 400 : null,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Cash (\$)',
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
          ],
        ),
      ),
    );
  }
}

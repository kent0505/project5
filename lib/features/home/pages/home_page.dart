import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../activities/pages/activities_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // context.read<MoneyBloc>().add(GetMoneysEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSettings) return const SettingsPage();

                if (state is HomeActivities) return const ActivitiesPage();

                return const _HomePage();
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 6),
            Text(
              'Good to see you!',
              style: TextStyle(
                color: AppColors.white50,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              userName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                const SizedBox(width: 5),
                Text(
                  'Your balance per ($userCurrency)',
                  style: TextStyle(
                    color: AppColors.white50,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 5),
                Container(
                  height: 78,
                  width: 182,
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '${userIncome - userExpense}$userCurrency',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const _ExpenceIncomeData(
                  expence: true,
                  number: 4000,
                ),
                const SizedBox(width: 12),
                const _ExpenceIncomeData(
                  expence: false,
                  number: 5000,
                ),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                const SizedBox(width: 5),
                Text(
                  'Add options',
                  style: TextStyle(
                    color: AppColors.white50,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _ExpenceIncomeAddButton(
                  title: 'Income',
                  onPressed: () {
                    context.push('/expense', extra: false);
                  },
                ),
                const SizedBox(width: 15),
                _ExpenceIncomeAddButton(
                  title: 'Expense',
                  onPressed: () {
                    context.push('/expense', extra: true);
                  },
                ),
              ],
            ),
            const SizedBox(height: 13),
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: AppColors.white50,
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpenceIncomeData extends StatelessWidget {
  const _ExpenceIncomeData({
    required this.expence,
    required this.number,
  });

  final bool expence;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          expence ? 'Expense' : 'Income',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 18,
          width: 54,
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$number$userCurrency',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExpenceIncomeAddButton extends StatelessWidget {
  const _ExpenceIncomeAddButton({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/page_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 17),
            PageTitle('Settings'),
            Spacer(),
            _SettingsTile(title: 'Terms of use'),
            SizedBox(height: 17),
            _SettingsTile(title: 'Privacy policy'),
            SizedBox(height: 17),
            _SettingsTile(title: 'Support page'),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width > 400 ? 400 : null,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}

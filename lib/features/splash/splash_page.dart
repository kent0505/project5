import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project5/core/widgets/custom_scaffold.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _init() async {
    await getData().then(
      (value) {
        Future.delayed(const Duration(seconds: 1), () {
          if (onboarding) {
            context.go('/onboard');
          } else {
            context.go('/home');
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          color: AppColors.white50,
        ),
      ),
    );
  }
}

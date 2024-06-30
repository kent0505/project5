import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: PageView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          // PAGE 1
          Center(
            child: Stack(
              children: [
                Positioned(
                  top: 62,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/wallet.png',
                    height: 270,
                  ),
                ),
                _Content(
                  title: 'Your personal\nfinance assistant',
                  subtitle:
                      'This mobile app simplify the use of\nyour finances',
                  current: true,
                  onPressed: () {
                    controller.animateToPage(
                      controller.page!.toInt() + 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                    log(controller.page!.toInt().toString());
                  },
                ),
              ],
            ),
          ),

          // PAGE 2
          Center(
            child: Stack(
              children: [
                Positioned(
                  top: 45,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/bank.png',
                    height: 300,
                  ),
                ),
                _Content(
                  title: 'Everything you\nneed is right here!',
                  subtitle:
                      'Keep an eye on your monetary\nassets, don\'t miss details',
                  current: true,
                  onPressed: () {
                    context.go('/user');
                    // controller.animateToPage(
                    //   controller.page!.toInt() - 1,
                    //   duration: const Duration(milliseconds: 200),
                    //   curve: Curves.easeIn,
                    // );
                    // log(controller.page!.toInt().toString());
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

class _Content extends StatelessWidget {
  const _Content({
    required this.title,
    required this.subtitle,
    this.current = false,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final bool current;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white50,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 61),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _PageIndicator(current: current),
              const SizedBox(width: 7),
              _PageIndicator(current: !current),
            ],
          ),
          const SizedBox(height: 45),
          PrimaryButton(
            title: 'Next',
            // active: false,
            onPressed: onPressed,
          ),
          const SizedBox(height: 67),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.current});

  final bool current;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: current ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          if (current)
            BoxShadow(
              color: AppColors.black25,
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  bool active = false;

  void onChanged() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onGo() async {
    // await saveUser(
    //   controller1.text,
    //   controller2.text,
    // ).then((value) {
    //   context.go('/home');
    // });
    context.go('/home');
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 127),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Enter your name...',
                  style: TextStyle(
                    color: AppColors.white50,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            _NameField(
              controller: controller1,
              onChanged: onChanged,
            ),
            const SizedBox(height: 14),
            const Text(
              'What currency do you use?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            const _CurrencSelectButton(),
            const Spacer(),
            PrimaryButton(
              title: 'Go',
              active: active,
              onPressed: onGo,
            ),
            const SizedBox(height: 67),
          ],
        ),
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Name',
          hintStyle: TextStyle(
            color: AppColors.white50,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}

class _CurrencSelectButton extends StatelessWidget {
  const _CurrencSelectButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width > 400 ? 400 : null,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
      ),
      // child: const Row(
      //   children: [
      //     Spacer(),
      //   ],
      // ),
    );
  }
}

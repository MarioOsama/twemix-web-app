import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/assets.dart';
import 'package:crm/core/widgets/app_button.dart';
import 'package:crm/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const double VERTICAL_SPACE = 35;

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.white,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.assetsPngCompanyLogo),
              const SizedBox(height: VERTICAL_SPACE + 20),
              const AppTextField(
                hint: 'Email',
                insideHint: true,
              ),
              const SizedBox(height: VERTICAL_SPACE),
              const AppTextField(
                hint: 'Password',
                insideHint: true,
                isObscured: true,
              ),
              const SizedBox(height: VERTICAL_SPACE + 10),
              AppButton(text: 'Login', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

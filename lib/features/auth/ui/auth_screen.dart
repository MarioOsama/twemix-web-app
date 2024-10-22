import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/assets.dart';
import 'package:crm/core/widgets/app_button.dart';
import 'package:crm/core/widgets/app_text_field.dart';
import 'package:crm/features/auth/logic/cubit/auth_cubit.dart';
import 'package:crm/features/auth/ui/widgets/auth_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: constant_identifier_names
const double VERTICAL_SPACE = 35;

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read<AuthCubit>();
    return Scaffold(
      body: _buildChild(context, authCubit),
    );
  }

  Widget _buildChild(BuildContext context, AuthCubit authCubit) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: AppColors.white,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.assetsPngCompanyLogo),
            const SizedBox(height: VERTICAL_SPACE + 20),
            AppTextField(
              controller: authCubit.emailController,
              hint: 'Email',
              insideHint: true,
            ),
            const SizedBox(height: VERTICAL_SPACE),
            AppTextField(
              controller: authCubit.passwordController,
              hint: 'Password',
              insideHint: true,
              isObscured: true,
            ),
            const SizedBox(height: VERTICAL_SPACE + 10),
            _buttonBuilder(authCubit),
            const AuthBlocListener(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<AuthCubit, AuthState> _buttonBuilder(AuthCubit authCubit) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state is AuthLoading?
            ? const CircularProgressIndicator()
            : AppTextButton(
                text: 'Login',
                onPressed: () => authCubit.login(),
              );
      },
    );
  }
}

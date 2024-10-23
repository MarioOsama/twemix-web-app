import 'package:crm/core/helpers/constants.dart';
import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/app_text_styles.dart';
import 'package:crm/features/home/logic/cubit/home_cubit.dart';
import 'package:crm/features/home/ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Row(
            children: [
              Expanded(child: AppDrawer()),
              Expanded(
                flex: 6,
                child: Center(
                  child: Text(
                    AppConstants.drawerItems[state.index].title +
                        ' ${AppConstants.drawerItems[state.index].subItems?[state.subIndex].title}',
                    style: AppTextStyles.font24BlackSemiBold(context),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

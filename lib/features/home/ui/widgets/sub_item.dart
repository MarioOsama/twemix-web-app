import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/app_text_styles.dart';
import 'package:crm/features/home/data/models/drawer_item_model.dart';
import 'package:crm/features/home/logic/cubit/home_cubit.dart';
import 'package:crm/features/home/ui/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubItem extends StatelessWidget {
  const SubItem({
    super.key,
    required this.drawerItemModel,
    required this.superIndex,
    required this.index,
  });

  static const double PADDING_SPACING = 30.0;
  static const double ITEM_HEIGHT = 40.0;

  final DrawerItemModel drawerItemModel;
  final int superIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = context
        .read<HomeCubit>()
        .isSubItemSelected(superIndex, drawerItemModel);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        0,
        5,
        PADDING_SPACING,
        0,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: DrawerItem.ANIMATION_DURATION),
        decoration: _buildContainerDecoration(isSelected),
        height: ITEM_HEIGHT,
        child: ListTile(
          onTap: () {
            // Change selected drawer item and sub item indices
            context.read<HomeCubit>().onDrawerSubItemChanged(superIndex, index);
          },
          horizontalTitleGap: DrawerItem.TITLE_GAP,
          leading: SvgPicture.asset(
            drawerItemModel.iconPath,
          ),
          title: _buildTitle(drawerItemModel.title, isSelected, context),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: DrawerItem.CONTENT_PADDING),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(bool isSelected) {
    return BoxDecoration(
      color: isSelected ? AppColors.lightGrey : AppColors.white,
      borderRadius: BorderRadius.circular(DrawerItem.BORDER_RADIUS),
    );
  }

  Text _buildTitle(String title, bool isSelected, BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.font18BlackMedium(context),
    );
  }
}

import 'package:crm/core/helpers/constants.dart';
import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/app_text_styles.dart';
import 'package:crm/features/home/data/models/drawer_item_model.dart';
import 'package:crm/features/home/logic/cubit/home_cubit.dart';
import 'package:crm/features/home/ui/widgets/sub_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.drawerItemModel,
    required this.index,
    this.subItems,
  });

  static const double TITLE_GAP = 20;
  static const double CONTENT_PADDING = 10;
  static const double BORDER_RADIUS = 5.0;
  static const double PADDING_SPACING = 14.0;
  static const double TITLE_TOP_MARGIN = 2.0;
  static const double ITEM_HEIGHT = 50.0;
  static const int ANIMATION_DURATION = 300;

  final DrawerItemModel drawerItemModel;
  final int index;
  final List<DrawerItemModel>? subItems;

  @override
  Widget build(BuildContext context) {
    final bool isSelected =
        context.read<HomeCubit>().isItemSelected(drawerItemModel);
    return Padding(
      padding: const EdgeInsets.all(PADDING_SPACING),
      child: subItems != null
          ? _buildListTileWithSubItems(context, isSelected)
          : _buildListTile(context, isSelected),
    );
  }

  Column _buildListTileWithSubItems(BuildContext context, bool isSelected) {
    return Column(
      children: [
        _buildListTile(context, isSelected),
        _buildSubItems(context, isSelected),
      ],
    );
  }

  AnimatedContainer _buildListTile(BuildContext context, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: ANIMATION_DURATION),
      decoration: _buildContainerDecoration(isSelected),
      height: ITEM_HEIGHT,
      child: ListTile(
        onTap: () => context.read<HomeCubit>().onDrawerItemChanged(index),
        contentPadding: const EdgeInsets.symmetric(horizontal: CONTENT_PADDING),
        horizontalTitleGap: TITLE_GAP,
        leading: _buildItemIcon(isSelected),
        title: _buildTitle(drawerItemModel.title, isSelected, context),
      ),
    );
  }

  Column _buildSubItems(BuildContext context, bool isSelected) {
    return Column(
      children: List.generate(subItems!.length, (supIndex) {
        return SubItem(
          drawerItemModel: subItems![supIndex],
          superIndex: index,
          index: supIndex,
        );
      }),
    );
  }

  SvgPicture _buildItemIcon(bool isSelected) {
    return SvgPicture.asset(
      drawerItemModel.iconPath,
      colorFilter: ColorFilter.mode(
        isSelected ? AppColors.white : AppColors.black,
        BlendMode.srcIn,
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(bool isSelected) {
    return BoxDecoration(
      color: isSelected ? AppColors.red : AppColors.white,
      gradient: isSelected
          ? const LinearGradient(colors: AppColors.redGradient)
          : null,
      borderRadius: BorderRadius.circular(BORDER_RADIUS),
      border: !isSelected
          ? Border.all(
              color: AppColors.grey,
              width: 1,
            )
          : null,
    );
  }

  Padding _buildTitle(String title, bool isSelected, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: TITLE_TOP_MARGIN),
      child: Text(
        title,
        style: isSelected
            ? AppTextStyles.font24WhiteSemiBold(context)
            : AppTextStyles.font22BlackMedium(context),
      ),
    );
  }
}

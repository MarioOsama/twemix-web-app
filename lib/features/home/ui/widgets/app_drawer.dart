import 'package:crm/core/helpers/constants.dart';
import 'package:crm/core/helpers/spacing.dart';
import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/assets.dart';
import 'package:crm/features/home/data/models/drawer_item_model.dart';
import 'package:crm/features/home/ui/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static const double SPACING = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildContainerDecoration(),
      child: Drawer(
        backgroundColor: AppColors.white,
        shape: const BeveledRectangleBorder(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(SPACING),
              child: Image.asset(Assets.assetsPngCompanyLogo),
            ),
            verticalSpace(SPACING),
            ..._buildDrawerItemsList(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return const BoxDecoration(
        border: Border(right: BorderSide(color: AppColors.grey, width: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 172, 172, 172),
            blurRadius: 4,
            offset: Offset(4, 0),
          ),
        ]);
  }

  _buildDrawerItemsList() {
    List<DrawerItemModel> drawerItems = AppConstants.drawerItems;
    return List.generate(drawerItems.length, (index) {
      return DrawerItem(
        drawerItemModel: drawerItems[index],
        subItems: drawerItems[index].subItems,
        index: index,
      );
    });
  }
}

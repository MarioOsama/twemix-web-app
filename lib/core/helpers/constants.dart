import 'package:crm/core/theming/assets.dart';
import 'package:crm/features/home/data/models/drawer_item_model.dart';

abstract class AppConstants {
  static const String appName = 'Twemix Web App';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // Home
  static const List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
      iconPath: Assets.assetsSvgAnalysisIcon,
      title: 'Analysis',
    ),
    DrawerItemModel(
      iconPath: Assets.assetsSvgIncomeIcon,
      title: 'Income',
      subItems: [
        DrawerItemModel(
          iconPath: Assets.assetsSvgInvoiceIcon,
          title: 'Invoices',
        ),
        DrawerItemModel(
          iconPath: Assets.assetsSvgCategoriesIcon,
          title: 'Categories',
        ),
      ],
    ),
    DrawerItemModel(
      iconPath: Assets.assetsSvgExpenseIcon,
      title: 'Expenses',
      subItems: [
        DrawerItemModel(
          iconPath: Assets.assetsSvgPaymentIcon,
          title: 'Payments',
        ),
        DrawerItemModel(
          iconPath: Assets.assetsSvgCategoriesIcon,
          title: 'Categories',
        ),
      ],
    ),
    DrawerItemModel(
      iconPath: Assets.assetsSvgCompanyIcon,
      title: 'Clients',
    ),
    DrawerItemModel(
        iconPath: Assets.assetsSvgEmployeeIcon,
        title: 'Employees',
        subItems: [
          DrawerItemModel(
            iconPath: Assets.assetsSvgPeopleIcon,
            title: 'People',
          ),
          DrawerItemModel(
            iconPath: Assets.assetsSvgPayrollIcon,
            title: 'Payrolls',
          ),
        ]),
    DrawerItemModel(
      iconPath: Assets.assetsSvgPersonIcon,
      title: 'Accounts',
      subItems: [
        DrawerItemModel(
          iconPath: Assets.assetsSvgStaffIcon,
          title: 'Staff',
        ),
        DrawerItemModel(
          iconPath: Assets.assetsSvgClientsIcon,
          title: 'Clients',
        ),
      ],
    ),
  ];
}

class DrawerItemModel {
  final String title;
  final String iconPath;
  final List<DrawerItemModel>? subItems;

  const DrawerItemModel(
      {required this.title, required this.iconPath, this.subItems});
}

import 'package:bloc/bloc.dart';
import 'package:crm/core/helpers/constants.dart';
import 'package:crm/features/home/data/models/drawer_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void onDrawerItemChanged(int index) {
    emit(HomeDrawerItemChanged(index, 0));
  }

  void onDrawerSubItemChanged(int parentIndex, int index) {
    onDrawerItemChanged(parentIndex);
    emit(HomeDrawerItemChanged(parentIndex, index));
  }

  bool isItemSelected(DrawerItemModel drawerItemModel) {
    return state.index == AppConstants.drawerItems.indexOf(drawerItemModel);
  }

  bool isSubItemSelected(int parentIndex, DrawerItemModel drawerItemModel) {
    return state.index == parentIndex &&
        state.subIndex ==
            AppConstants.drawerItems[parentIndex].subItems
                ?.indexOf(drawerItemModel);
  }
}

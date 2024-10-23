part of 'home_cubit.dart';

abstract class HomeState {
  int get index => 0;

  int get subIndex => 0;
}

final class HomeInitial extends HomeState {}

final class HomeDrawerItemChanged extends HomeState {
  final int selectedIndex;
  final int selectedSubIndex;

  HomeDrawerItemChanged(this.selectedIndex, this.selectedSubIndex);

  @override
  int get index => selectedIndex;

  @override
  int get subIndex => selectedSubIndex;
}

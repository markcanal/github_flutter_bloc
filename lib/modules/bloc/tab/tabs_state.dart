part of 'tabs_bloc.dart';

abstract class TabsState extends Equatable {
  const TabsState();

  @override
  List<Object> get props => [];
}

class TabsInitial extends TabsState {}

class TabsInitialize extends TabsState {
  const TabsInitialize(this.tabController);
  final TabController tabController;
  @override
  List<Object> get props => [tabController];
}

class TabsonClick extends TabsState {
  const TabsonClick(this.list);
  final List<Widget> list;

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'TabsonClick $list';
}

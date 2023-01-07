part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.pageIndex = 0,
  });

  final int pageIndex;

  SettingsState copyWith({
    int? pageIndex,
  }) =>
      SettingsState(
        pageIndex: pageIndex ?? this.pageIndex,
      );

  @override
  List<Object> get props => [pageIndex];
}

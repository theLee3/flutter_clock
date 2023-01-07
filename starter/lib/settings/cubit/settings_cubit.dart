import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin {
  SettingsCubit() : super(const SettingsState());

  void update(SettingsState state) => emit(state);

  @override
  SettingsState? fromJson(Map<String, dynamic> json) => SettingsState(
        pageIndex: json['page_index'],
      );

  @override
  Map<String, dynamic>? toJson(SettingsState state) => {
        'page_index': state.pageIndex,
      };
}

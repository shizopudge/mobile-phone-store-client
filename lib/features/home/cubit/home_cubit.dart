import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'home_cubit.freezed.dart';
part 'home_cubit.g.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with HydratedMixin {
  HomeCubit() : super(const HomeState());

  void changePage(int page) => emit(state.copyWith(page: page));

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    if (kIsWeb) {
      return HomeState.fromJson(json);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    if (kIsWeb) {
      return state.toJson();
    }
    return null;
  }
}

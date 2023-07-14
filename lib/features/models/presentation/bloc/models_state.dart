part of 'models_bloc.dart';

enum ModelsStatus {
  initial,
  loading,
  refreshing,
  success,
  failure;

  bool get isInitial => this == ModelsStatus.initial;
  bool get isLoading => this == ModelsStatus.loading;
  bool get isRefreshing => this == ModelsStatus.refreshing;
  bool get isSuccess => this == ModelsStatus.success;
  bool get isFailure => this == ModelsStatus.failure;
}

@freezed
class ModelsState with _$ModelsState {
  const ModelsState._();
  const factory ModelsState({
    @Default(Info.initial()) Info info,
    @Default([]) List<Model> models,
    @Default(ModelsStatus.initial) ModelsStatus status,
    @Default(SimpleFilter()) SimpleFilter filter,
    @Default(CasualFailure()) Failure failure,
    Manufacturer? manufacturer,
  }) = _ModelsState;

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading && models.isEmpty;
  bool get isRefreshing => status.isRefreshing;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
  bool get isPaginating => status.isLoading && models.isNotEmpty;

  bool get isLastPage => info.countOnPage < filter.limit && models.isNotEmpty;
  bool get isNothingFound => models.isEmpty;
  bool get isFilterActive => filter != const SimpleFilter();
}

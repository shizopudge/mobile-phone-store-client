part of 'manufacturers_bloc.dart';

enum ManufacturersStatus {
  initial,
  loading,
  refreshing,
  success,
  failure;

  bool get isInitial => this == ManufacturersStatus.initial;
  bool get isLoading => this == ManufacturersStatus.loading;
  bool get isRefreshing => this == ManufacturersStatus.refreshing;
  bool get isSuccess => this == ManufacturersStatus.success;
  bool get isFailure => this == ManufacturersStatus.failure;
}

@freezed
class ManufacturersState with _$ManufacturersState {
  const ManufacturersState._();
  const factory ManufacturersState({
    @Default(Info.initial()) Info info,
    @Default([]) List<Manufacturer> manufacturers,
    @Default(ManufacturersStatus.initial) ManufacturersStatus status,
    @Default(SimpleFilter()) SimpleFilter filter,
    @Default(CasualFailure()) Failure failure,
  }) = _ManufacturersState;

  factory ManufacturersState.fromJson(Map<String, dynamic> json) =>
      _$ManufacturersStateFromJson(json);

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading && manufacturers.isEmpty;
  bool get isRefreshing => status.isRefreshing;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
  bool get isPaginating => status.isLoading && manufacturers.isNotEmpty;

  bool get isLastPage =>
      info.countOnPage < filter.limit && manufacturers.isNotEmpty;
  bool get isNothingFound => manufacturers.isEmpty;
  bool get isFilterActive => filter != const SimpleFilter();
}

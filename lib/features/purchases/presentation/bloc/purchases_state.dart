part of 'purchases_bloc.dart';

enum PurchasesStatus {
  initial,
  loading,
  refreshing,
  success,
  failure;

  bool get isInitial => this == PurchasesStatus.initial;
  bool get isLoading => this == PurchasesStatus.loading;
  bool get isRefreshing => this == PurchasesStatus.refreshing;
  bool get isSuccess => this == PurchasesStatus.success;
  bool get isFailure => this == PurchasesStatus.failure;
}

@freezed
class PurchasesState with _$PurchasesState {
  const PurchasesState._();
  const factory PurchasesState({
    @Default(Info.initial()) Info info,
    @Default([]) List<Purchase> purchases,
    @Default(PurchasesStatus.initial) PurchasesStatus status,
    @Default(SimpleFilter()) SimpleFilter filter,
    @Default(CasualFailure()) Failure failure,
  }) = _PurchasesState;

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading && purchases.isEmpty;
  bool get isRefreshing => status.isRefreshing;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
  bool get isPaginating => status.isLoading && purchases.isNotEmpty;

  bool get isLastPage =>
      info.countOnPage < filter.limit && purchases.isNotEmpty;
  bool get isNothingFound => purchases.isEmpty;
  bool get isFilterActive => filter != const SimpleFilter();
}

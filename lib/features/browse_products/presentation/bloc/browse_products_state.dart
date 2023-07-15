part of 'browse_products_bloc.dart';

enum BrowseProductsStatus {
  initial,
  loading,
  refreshing,
  success,
  failure;

  bool get isInitial => this == BrowseProductsStatus.initial;
  bool get isLoading => this == BrowseProductsStatus.loading;
  bool get isRefreshing => this == BrowseProductsStatus.refreshing;
  bool get isSuccess => this == BrowseProductsStatus.success;
  bool get isFailure => this == BrowseProductsStatus.failure;
}

@freezed
class BrowseProductsState with _$BrowseProductsState {
  const BrowseProductsState._();
  const factory BrowseProductsState({
    @Default(Info.initial()) Info info,
    @Default([]) List<Product> products,
    @Default(ProductsFilter()) ProductsFilter filter,
    @Default(BrowseProductsStatus.initial) BrowseProductsStatus status,
    @Default(CasualFailure()) Failure failure,
  }) = _BrowseProductsState;

  factory BrowseProductsState.fromJson(Map<String, dynamic> json) =>
      _$BrowseProductsStateFromJson(json);

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading && products.isEmpty;
  bool get isRefreshing => status.isRefreshing;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
  bool get isPaginating => status.isLoading && products.isNotEmpty;

  bool get isLastPage => info.countOnPage < filter.limit && products.isNotEmpty;
  bool get isNothingFound => products.isEmpty;
  bool get isFilterActive => filter != const ProductsFilter();
}

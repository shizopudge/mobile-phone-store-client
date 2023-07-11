part of 'search_products_bloc.dart';

enum SearchProductsStatus {
  initial,
  loading,
  refreshing,
  success,
  failure;

  bool get isInitial => this == SearchProductsStatus.initial;
  bool get isLoading => this == SearchProductsStatus.loading;
  bool get isRefreshing => this == SearchProductsStatus.refreshing;
  bool get isSuccess => this == SearchProductsStatus.success;
  bool get isFailure => this == SearchProductsStatus.failure;
}

@freezed
class SearchProductsState with _$SearchProductsState {
  const SearchProductsState._();
  const factory SearchProductsState({
    @Default(Info.initial()) Info info,
    @Default([]) List<Product> products,
    @Default(ProductsFilter()) ProductsFilter filter,
    @Default(SearchProductsStatus.initial) SearchProductsStatus status,
    @Default(CasualFailure()) Failure failure,
  }) = _SearchProductsState;

  factory SearchProductsState.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsStateFromJson(json);

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading && products.isEmpty;
  bool get isRefreshing => status.isRefreshing;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
  bool get isPaginating => status.isLoading && products.isNotEmpty;

  bool get isLastPage => info.countOnPage < filter.limit && products.isNotEmpty;
}

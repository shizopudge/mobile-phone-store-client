part of 'wishlist_bloc.dart';

enum WishlistStatus {
  initial,
  loading,
  refreshing,
  success,
  failure;

  bool get isInitial => this == WishlistStatus.initial;
  bool get isLoading => this == WishlistStatus.loading;
  bool get isRefreshing => this == WishlistStatus.refreshing;
  bool get isSuccess => this == WishlistStatus.success;
  bool get isFailure => this == WishlistStatus.failure;
}

@freezed
class WishlistState with _$WishlistState {
  const WishlistState._();
  const factory WishlistState({
    @Default(Info.initial()) Info info,
    @Default([]) List<Product> products,
    @Default(ProductsFilter()) ProductsFilter filter,
    @Default(WishlistStatus.initial) WishlistStatus status,
    @Default(CasualFailure()) Failure failure,
  }) = _WishlistState;

  factory WishlistState.fromJson(Map<String, dynamic> json) =>
      _$WishlistStateFromJson(json);

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

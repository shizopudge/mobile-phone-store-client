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
    @Default([]) List<Product> wishlist,
    @Default(ProductsFilter()) ProductsFilter filter,
    @Default(WishlistStatus.initial) WishlistStatus status,
    @Default(CasualFailure()) Failure failure,
  }) = _WishlistState;

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading;
  bool get isRefreshing => status.isRefreshing;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
  bool get isPaginating => status.isLoading && wishlist.isNotEmpty;

  bool get isLastPage => info.countOnPage < filter.limit && wishlist.isNotEmpty;
}

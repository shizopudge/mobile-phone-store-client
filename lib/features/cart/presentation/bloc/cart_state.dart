part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  loading,
  refreshing,
  success,
  failure;

  bool get isInitial => this == CartStatus.initial;
  bool get isLoading => this == CartStatus.loading;
  bool get isRefreshing => this == CartStatus.refreshing;
  bool get isSuccess => this == CartStatus.success;
  bool get isFailure => this == CartStatus.failure;
}

@freezed
class CartState with _$CartState {
  const CartState._();
  const factory CartState({
    @Default(Info.initial()) Info info,
    @Default([]) List<Product> products,
    @Default(ProductsFilter()) ProductsFilter filter,
    @Default(CartStatus.initial) CartStatus status,
    @Default(CasualFailure()) Failure failure,
  }) = _CartState;

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);

  double _getTotalCost() {
    double totalCost = 0.0;
    for (Product product in products) {
      totalCost += product.cost;
    }
    return totalCost;
  }

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading && products.isEmpty;
  bool get isRefreshing => status.isRefreshing;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
  bool get isPaginating => status.isLoading && products.isNotEmpty;

  bool get isLastPage => info.countOnPage < filter.limit && products.isNotEmpty;
  bool get isNothingFound => products.isEmpty;
  bool get isFilterActive => filter != const ProductsFilter();

  double get totalCost => _getTotalCost();
}

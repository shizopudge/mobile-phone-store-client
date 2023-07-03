part of 'products_bloc.dart';

enum ProductStatus {
  loading,
  refreshing,
  success,
  failure;

  bool get isLoading => this == ProductStatus.loading;
  bool get isRefreshing => this == ProductStatus.refreshing;
  bool get isSuccess => this == ProductStatus.success;
  bool get isFailure => this == ProductStatus.failure;
}

@freezed
class ProductsState with _$ProductsState {
  const ProductsState._();
  const factory ProductsState({
    @Default(Info.initial()) Info info,
    @Default([]) List<Product> products,
    @Default(ProductsFilter()) ProductsFilter filter,
    @Default(ProductStatus.loading) ProductStatus status,
    @Default(UnknownFailure()) Failure failure,
    Product? selectedProduct,
  }) = _ProductsState;

  bool get isLoading => status.isLoading;
  bool get isRefreshing => status.isRefreshing;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
}

class ProductsFilter extends Equatable {
  final int page;
  final int limit;
  final String query;
  final SortBy sort;
  const ProductsFilter({
    this.page = 1,
    this.limit = 2,
    this.query = '',
    this.sort = SortBy.desc,
  });

  ProductsFilter copyWith({
    int? page,
    int? limit,
    String? query,
    SortBy? sort,
  }) {
    return ProductsFilter(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      query: query ?? this.query,
      sort: sort ?? this.sort,
    );
  }

  @override
  List<Object> get props => [page, limit, query, sort];
}

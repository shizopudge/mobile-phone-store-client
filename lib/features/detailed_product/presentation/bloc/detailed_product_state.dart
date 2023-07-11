part of 'detailed_product_bloc.dart';

enum DetailedProductStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == DetailedProductStatus.initial;
  bool get isLoading => this == DetailedProductStatus.loading;
  bool get isSuccess => this == DetailedProductStatus.success;
  bool get isFailure => this == DetailedProductStatus.failure;
}

@freezed
class DetailedProductState with _$DetailedProductState {
  const DetailedProductState._();
  const factory DetailedProductState({
    Product? product,
    @Default(DetailedProductStatus.initial) DetailedProductStatus status,
    @Default(CasualFailure()) Failure failure,
  }) = _DetailedProductState;

  factory DetailedProductState.fromJson(Map<String, dynamic> json) =>
      _$DetailedProductStateFromJson(json);

  bool get isInitial => status == DetailedProductStatus.initial;
  bool get isLoading => status == DetailedProductStatus.loading;
  bool get isLoaded => status == DetailedProductStatus.success;
  bool get isFailure => status == DetailedProductStatus.failure;
}

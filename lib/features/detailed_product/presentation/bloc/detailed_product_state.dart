part of 'detailed_product_bloc.dart';

enum DetailedProductStatus {
  initial,
  loading,
  creatingPurchase,
  success,
  failure;

  bool get isInitial => this == DetailedProductStatus.initial;
  bool get isLoading => this == DetailedProductStatus.loading;
  bool get isCreatingPurchase => this == DetailedProductStatus.creatingPurchase;
  bool get isSuccess => this == DetailedProductStatus.success;
  bool get isFailure => this == DetailedProductStatus.failure;
}

@freezed
class DetailedProductState with _$DetailedProductState {
  const DetailedProductState._();
  const factory DetailedProductState({
    Product? product,
    CreatePurchaseResponse? purchase,
    @Default(DetailedProductStatus.initial) DetailedProductStatus status,
    @Default(CasualFailure()) Failure failure,
  }) = _DetailedProductState;

  factory DetailedProductState.fromJson(Map<String, dynamic> json) =>
      _$DetailedProductStateFromJson(json);

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading;
  bool get isCreatingPurchase => status.isCreatingPurchase;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
}

part of 'detailed_product_bloc.dart';

@freezed
class DetailedProductEvent with _$DetailedProductEvent {
  const factory DetailedProductEvent.getOneProduct(
      {required String id, @Default(false) bool isInitial}) = _GetOneProduct;
  const factory DetailedProductEvent.changeProduct(Product product) =
      _ChangeProduct;
  const factory DetailedProductEvent.changeColor(String? newColorCode) =
      _ChangeColor;
  const factory DetailedProductEvent.changeStorage(int? newStorage) =
      _ChangeStorage;
  const factory DetailedProductEvent.createPurchase() = _CreatePurchase;
  const factory DetailedProductEvent.removePurchase() = _RemovePurchase;
  const factory DetailedProductEvent.openUrl() = _OpenUrl;
  const factory DetailedProductEvent.reset() = _Reset;
}

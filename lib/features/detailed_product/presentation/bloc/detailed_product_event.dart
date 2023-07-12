part of 'detailed_product_bloc.dart';

@freezed
class DetailedProductEvent with _$DetailedProductEvent {
  const factory DetailedProductEvent.getOneProduct(
      {required String id, @Default(false) bool isInitial}) = _GetOneProduct;
  const factory DetailedProductEvent.changeProduct(Product? product) =
      _ChangeProduct;
  const factory DetailedProductEvent.changeColor(String? newColorCode) =
      _ChangeColor;
  const factory DetailedProductEvent.changeStorage(int? newStorage) =
      _ChangeStorage;
}

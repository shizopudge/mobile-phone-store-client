part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.start() = _Start;
  const factory ProductsEvent.getProducts() = _GetProducts;
}

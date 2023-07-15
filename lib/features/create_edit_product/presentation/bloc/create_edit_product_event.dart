part of 'create_edit_product_bloc.dart';

@freezed
class CreateEditProductEvent with _$CreateEditProductEvent {
  const factory CreateEditProductEvent.setProduct(Product product) =
      _SetProduct;
  const factory CreateEditProductEvent.setModelId(String modelId) = _SetModelId;
  const factory CreateEditProductEvent.changeCost(double cost) = _ChangeCost;
  const factory CreateEditProductEvent.changeColor(
    String name,
  ) = _ChangeColor;
  const factory CreateEditProductEvent.changeColorCode(
    String code,
  ) = _ChangeColorCode;
  const factory CreateEditProductEvent.changeStorage(int storage) =
      _ChangeStorage;
  const factory CreateEditProductEvent.changeInStockCount(int inStockCount) =
      _ChangeInStockCount;
  const factory CreateEditProductEvent.changeDiscount(int discount) =
      _ChangeDiscount;
  const factory CreateEditProductEvent.pickImages() = _PickImages;
  const factory CreateEditProductEvent.removePickedImage(File image) =
      _RemovePickedImage;
  const factory CreateEditProductEvent.deleteImage(String imageLink) =
      _DeleteImage;
  const factory CreateEditProductEvent.createProduct() = _CreateProduct;
  const factory CreateEditProductEvent.editProduct() = _EditProduct;
  const factory CreateEditProductEvent.deleteProduct() = _DeleteProduct;
  const factory CreateEditProductEvent.reset() = _Reset;
}

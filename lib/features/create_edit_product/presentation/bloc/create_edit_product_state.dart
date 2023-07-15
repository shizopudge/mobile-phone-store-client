part of 'create_edit_product_bloc.dart';

enum CreateEditProductStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == CreateEditProductStatus.loading;
  bool get isSuccess => this == CreateEditProductStatus.success;
  bool get isFailure => this == CreateEditProductStatus.failure;

  void callWhen({
    required VoidCallback? success,
    required VoidCallback? failure,
  }) {
    switch (this) {
      case CreateEditProductStatus.success:
        success?.call();
      case CreateEditProductStatus.failure:
        failure?.call();
      default:
    }
  }
}

@freezed
class CreateEditProductState with _$CreateEditProductState {
  const CreateEditProductState._();
  const factory CreateEditProductState({
    @Default('') String color,
    @Default('') String colorCode,
    @Default(0.0) double cost,
    @Default(0) int storage,
    @Default([]) List<File> images,
    @Default(0) int inStockCount,
    @Default(0) int discount,
    @Default(CreateEditProductStatus.initial) CreateEditProductStatus status,
    @Default(CasualFailure()) Failure failure,
    String? modelId,
    Product? product,
  }) = _CreateEditProductState;

  void callWhen({
    VoidCallback? success,
    VoidCallback? failure,
  }) =>
      status.callWhen(
        success: success,
        failure: failure,
      );

  bool _isAvailable() {
    if (product != null) {
      if ((color.isNotEmpty && color != product!.color) ||
          (colorCode.isNotEmpty && colorCode != product!.colorCode) ||
          (cost != 0.0 && cost != product!.cost) ||
          (storage != 0 && storage != product!.storage) ||
          (inStockCount != product!.inStockCount) ||
          ((discount == 0 ? null : discount) != product!.discount) ||
          images.isNotEmpty) {
        return true;
      }
      return false;
    } else {
      if (color.isNotEmpty &&
          colorCode.isNotEmpty &&
          cost != 0.0 &&
          storage != 0) {
        return true;
      }
    }
    return false;
  }

  bool get isAvailable => _isAvailable();

  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;

  bool get hasImages => (images.length + (product?.images.length ?? 0)) > 0;

  int get productImagesLength => product?.images.length ?? 0;

  int get uploadedImagesLength => images.length;
}

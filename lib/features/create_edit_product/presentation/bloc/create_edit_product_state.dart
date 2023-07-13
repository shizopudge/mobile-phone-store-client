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
    @Default('') String modelId,
    double? cost,
    int? storage,
    int? screenRefreshRate,
    @Default(CreateEditProductStatus.initial) CreateEditProductStatus status,
    @Default(CasualFailure()) Failure failure,
    List<File>? images,
    Product? model,
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
    if (model != null) {
    } else {}
    return false;
  }

  bool get isAvailable => _isAvailable();

  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
}

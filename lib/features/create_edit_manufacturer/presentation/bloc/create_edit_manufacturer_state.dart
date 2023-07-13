part of 'create_edit_manufacturer_bloc.dart';

enum CreateEditManufacturerStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == CreateEditManufacturerStatus.loading;
  bool get isSuccess => this == CreateEditManufacturerStatus.success;
  bool get isFailure => this == CreateEditManufacturerStatus.failure;

  void callWhen({
    required VoidCallback? success,
    required VoidCallback? failure,
  }) {
    switch (this) {
      case CreateEditManufacturerStatus.success:
        success?.call();
      case CreateEditManufacturerStatus.failure:
        failure?.call();
      default:
    }
  }
}

@freezed
class CreateEditManufacturerState with _$CreateEditManufacturerState {
  const CreateEditManufacturerState._();
  const factory CreateEditManufacturerState({
    @Default('') String name,
    @Default(CreateEditManufacturerStatus.initial)
    CreateEditManufacturerStatus status,
    @Default(CasualFailure()) Failure failure,
    File? image,
    Manufacturer? manufacturer,
  }) = _CreateEditManufacturerState;

  void callWhen({
    VoidCallback? success,
    VoidCallback? failure,
  }) =>
      status.callWhen(
        success: success,
        failure: failure,
      );

  bool _isAvailable() {
    if (manufacturer != null) {
      if ((name != manufacturer!.name && name.length > 1) || image != null) {
        return true;
      }
    } else {
      if (name.length > 1) {
        return true;
      }
    }
    return false;
  }

  bool get isAvailable => _isAvailable();

  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
}

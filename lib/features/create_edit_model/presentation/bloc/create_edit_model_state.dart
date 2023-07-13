part of 'create_edit_model_bloc.dart';

enum CreateEditModelStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == CreateEditModelStatus.loading;
  bool get isSuccess => this == CreateEditModelStatus.success;
  bool get isFailure => this == CreateEditModelStatus.failure;

  void callWhen({
    required VoidCallback? success,
    required VoidCallback? failure,
  }) {
    switch (this) {
      case CreateEditModelStatus.success:
        success?.call();
      case CreateEditModelStatus.failure:
        failure?.call();
      default:
    }
  }
}

@freezed
class CreateEditModelState with _$CreateEditModelState {
  const CreateEditModelState._();
  const factory CreateEditModelState({
    @Default('') String name,
    @Default('') String description,
    @Default('') String manufacturerId,
    int? pixelDensity,
    int? screenRefreshRate,
    double? screenDiagonal,
    int? weight,
    @Default('') String screenResolution,
    @Default(OperatingSystem.ANDROID) OperatingSystem operatingSystem,
    @Default(DisplayType.AMOLED) DisplayType displayType,
    @Default(CreateEditModelStatus.initial) CreateEditModelStatus status,
    @Default(CasualFailure()) Failure failure,
    File? image,
    Model? model,
  }) = _CreateEditModelState;

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
      if ((name.isNotEmpty && name != model!.name) ||
          description != model!.description ||
          (manufacturerId.isNotEmpty &&
              manufacturerId != model!.manufacturer.id) ||
          (pixelDensity != null && pixelDensity != model!.pixelDensity) ||
          (screenRefreshRate != null &&
              screenRefreshRate != model!.screenRefreshRate) ||
          (screenDiagonal != null && screenDiagonal != model!.screenDiagonal) ||
          (weight != null && weight != model!.weight) ||
          (screenResolution.isNotEmpty &&
              screenResolution != model!.screenResolution) ||
          operatingSystem != model!.operatingSystem ||
          displayType != model!.displayType) {
        return true;
      }
    } else {
      if (name.isNotEmpty &&
          manufacturerId.isNotEmpty &&
          pixelDensity != null &&
          screenRefreshRate != null &&
          screenDiagonal != null &&
          weight != null &&
          screenResolution.isNotEmpty) {
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

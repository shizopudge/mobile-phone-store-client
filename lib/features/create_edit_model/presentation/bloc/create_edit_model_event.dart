part of 'create_edit_model_bloc.dart';

@freezed
class CreateEditModelEvent with _$CreateEditModelEvent {
  const factory CreateEditModelEvent.setModel(Model model) = _SetModel;
  const factory CreateEditModelEvent.changeName(String name) = _ChangeName;
  const factory CreateEditModelEvent.changeDescription(String description) =
      _ChangeDescription;
  const factory CreateEditModelEvent.changeManufacturerId(
      String manufacturerId) = _ChangeManufacturerId;
  const factory CreateEditModelEvent.changePixelDensity(int pixelDensity) =
      _ChangePixelDensity;
  const factory CreateEditModelEvent.changeScreenRefreshRate(
      int screenRefreshRate) = _ChangeScreenRefreshRate;
  const factory CreateEditModelEvent.changeScreenDiagonal(
      double screenDiagonal) = _ChangeScreenDiagonal;
  const factory CreateEditModelEvent.changeWeight(int weight) = _ChangeWeight;
  const factory CreateEditModelEvent.changeScreenResolution(
      String screenResolution) = _ChangeScreenResolution;
  const factory CreateEditModelEvent.changeOperatingSystem(
      OperatingSystem operatingSystem) = _ChangeOperatingSystem;
  const factory CreateEditModelEvent.changeDisplayType(
      DisplayType displayType) = _ChangeDisplayType;
  const factory CreateEditModelEvent.createModel() = _CreateModel;
  const factory CreateEditModelEvent.editModel() = _EditModel;
}

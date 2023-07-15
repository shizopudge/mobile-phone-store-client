part of 'create_edit_manufacturer_bloc.dart';

@freezed
class CreateEditManufacturerEvent with _$CreateEditManufacturerEvent {
  const factory CreateEditManufacturerEvent.initial() = _Initial;
  const factory CreateEditManufacturerEvent.setManufacturer(
      Manufacturer manufacturer) = _SetManufacturer;
  const factory CreateEditManufacturerEvent.changeName(String name) =
      _ChangeName;
  const factory CreateEditManufacturerEvent.createManufacturer() =
      _CreateManufacturer;
  const factory CreateEditManufacturerEvent.editManufacturer() =
      _EditManufacturer;
  const factory CreateEditManufacturerEvent.pickImage() = _PickImage;
  const factory CreateEditManufacturerEvent.deleteImage() = _DeleteImage;
  const factory CreateEditManufacturerEvent.reset() = _Reset;
}

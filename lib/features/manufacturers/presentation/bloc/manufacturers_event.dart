part of 'manufacturers_bloc.dart';

@freezed
class ManufacturersEvent with _$ManufacturersEvent {
  const factory ManufacturersEvent.initial() = _Initial;
  const factory ManufacturersEvent.refresh() = _Refresh;
  const factory ManufacturersEvent.searchManufacturers(String query) =
      _SearchManufacturers;
  const factory ManufacturersEvent.updateManufacturerInList(
      Manufacturer manufacturer) = _UpdateManufacturerInList;
  const factory ManufacturersEvent.getNextManufacturers() =
      _GetNextManufacturers;
}

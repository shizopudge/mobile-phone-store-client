part of 'models_bloc.dart';

@freezed
class ModelsEvent with _$ModelsEvent {
  const factory ModelsEvent.initial() = _Initial;
  const factory ModelsEvent.refresh() = _Refresh;
  const factory ModelsEvent.searchModels(String query) = _SearchModels;
  const factory ModelsEvent.updateModelInList(Model model) = _UpdateModelInList;
  const factory ModelsEvent.getNextModels() = _GetNextModels;
  const factory ModelsEvent.setManufacturer(Manufacturer manufacturer) =
      _SetManufacturer;
  const factory ModelsEvent.deleteModel(Model model) = _DeleteModel;
  const factory ModelsEvent.reset() = _Reset;
}

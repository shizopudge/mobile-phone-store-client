part of 'create_edit_product_bloc.dart';

@freezed
class CreateEditProductEvent with _$CreateEditProductEvent {
  const factory CreateEditProductEvent.started() = _Started;
}
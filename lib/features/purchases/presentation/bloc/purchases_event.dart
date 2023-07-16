part of 'purchases_bloc.dart';

@freezed
class PurchasesEvent with _$PurchasesEvent {
  const factory PurchasesEvent.started() = _Started;
}
part of 'purchases_bloc.dart';

@freezed
class PurchasesEvent with _$PurchasesEvent {
  const factory PurchasesEvent.initial() = _Initial;
  const factory PurchasesEvent.refresh() = _Refresh;
  const factory PurchasesEvent.searchPurchases(String query) = _SearchPurchases;
  const factory PurchasesEvent.getNextPurchases() = _GetNextPurchases;
  const factory PurchasesEvent.changeStatus({
    required Purchase purchase,
    required PurchaseStatus status,
  }) = _ChangeStatus;
  const factory PurchasesEvent.openUrl(Purchase purchase) = _OpenUrl;
  const factory PurchasesEvent.reset() = _Reset;
}

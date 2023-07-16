part of 'internet_connection_check_cubit.dart';

@freezed
class InternetConnectionCheckState with _$InternetConnectionCheckState {
  const factory InternetConnectionCheckState.loading() = _Loading;
  const factory InternetConnectionCheckState.connected() = _Connected;
  const factory InternetConnectionCheckState.disconnected() = _Disconnected;
}

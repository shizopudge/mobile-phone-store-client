import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';
part 'failure.g.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unknownFailure({
    @Default('Something went wrong...') String message,
  }) = UnknownFailure;

  const factory Failure.serverFailure({
    required dynamic message,
    String? error,
    required int statusCode,
  }) = ServerFailure;

  const factory Failure.cacheFailure({
    required String message,
  }) = CacheFailure;

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);
}

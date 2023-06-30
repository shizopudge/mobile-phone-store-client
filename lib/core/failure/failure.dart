import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/extensions.dart';

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

  static String dynamicMessageToString(dynamic message) {
    if (message is List) {
      List<String> messageItems = [];
      for (int i = 0; i < message.length; i++) {
        messageItems.add(i == 0
            ? message[i].toString().firstToUpperCase()
            : message[i].toString());
      }
      return messageItems.join(', ');
    } else {
      return message.toString().firstToUpperCase();
    }
  }
}

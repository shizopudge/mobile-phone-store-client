import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../constants/extensions.dart';
import '../utils/popup_utils.dart';

part 'failure.freezed.dart';
part 'failure.g.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.casualFailure({
    @Default('Something went wrong...') String message,
  }) = CasualFailure;

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

  void call(BuildContext context) {
    if (isUnauthorized) {
      callUnauthorized(context);
    } else {
      PopupUtils.showFailureSnackBar(context: context, failure: this);
    }
  }

  void callUnauthorized(BuildContext context) {
    PopupUtils.showFailureSnackBar(context: context, failure: this);
    context.read<AuthBloc>().add(const AuthEvent.kickUnauthorizedUser());
  }

  bool _isUnauthorizedFailure() {
    final Failure failure = this;
    if (failure is ServerFailure && failure.statusCode == 401) return true;
    return false;
  }

  bool get isUnauthorized => _isUnauthorizedFailure();
}

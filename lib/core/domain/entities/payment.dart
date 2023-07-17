// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:phone_store/core/data/models/payment/payment_model.dart';

class Payment extends Equatable {
  final String id;
  final String cost;
  final String currency;
  final String description;
  final String url;

  const Payment({
    required this.id,
    required this.cost,
    required this.currency,
    required this.description,
    required this.url,
  });

  factory Payment.fromModel(PaymentModel model) => Payment(
      id: model.id,
      cost: model.cost,
      currency: model.currency,
      description: model.description,
      url: model.url);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cost': cost,
      'currency': currency,
      'description': description,
      'url': url,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] as String,
      cost: map['cost'] as String,
      currency: map['currency'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [id, cost, currency, url];
}

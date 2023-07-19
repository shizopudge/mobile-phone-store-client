import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/create_purchase_response/create_purchase_response_model.dart';
import 'payment.dart';
import 'purchase.dart';

class CreatePurchaseResponse extends Equatable {
  final Purchase purchase;
  final Payment payment;
  const CreatePurchaseResponse({
    required this.purchase,
    required this.payment,
  });

  factory CreatePurchaseResponse.fromModel(CreatePurchaseResponseModel model) =>
      CreatePurchaseResponse(
        purchase: Purchase.fromModel(model.purchase),
        payment: Payment.fromModel(model.payment),
      );

  @override
  List<Object?> get props => [purchase, payment];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'purchase': purchase.toMap(),
      'payment': payment.toMap(),
    };
  }

  factory CreatePurchaseResponse.fromMap(Map<String, dynamic> map) {
    return CreatePurchaseResponse(
      purchase: Purchase.fromMap(map['purchase'] as Map<String, dynamic>),
      payment: Payment.fromMap(map['payment'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatePurchaseResponse.fromJson(String source) =>
      CreatePurchaseResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

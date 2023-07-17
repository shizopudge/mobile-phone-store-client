import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../constants/enums.dart';
import '../../data/models/purchase/purchase_model.dart';

class Purchase extends Equatable {
  final String id;
  final String createdAt;
  final String updatedAt;
  final PurchaseStatus status;
  final String userId;

  const Purchase({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.userId,
  });

  factory Purchase.fromModel(PurchaseModel model) {
    final String createdAt =
        DateTime.tryParse(model.createdAt)?.toLocal().toString() ??
            DateTime.now().toString();
    final String updatedAt =
        DateTime.tryParse(model.updatedAt)?.toLocal().toString() ??
            DateTime.now().toString();
    return Purchase(
      id: model.id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      status: model.status,
      userId: model.userId,
    );
  }

  @override
  List<Object?> get props => [id, createdAt, updatedAt, status, userId];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'status': status.toString(),
      'userId': userId,
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      status: PurchaseStatus.fromString(map['status'] as String),
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Purchase.fromJson(String source) =>
      Purchase.fromMap(json.decode(source) as Map<String, dynamic>);
}

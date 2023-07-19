// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../constants/enums.dart';
import '../../data/models/product/product_model.dart';
import '../../data/models/purchase/purchase_model.dart';
import 'product.dart';

class Purchase extends Equatable {
  final String id;
  final String createdAt;
  final String updatedAt;
  final PurchaseStatus status;
  final double cost;
  final String paymentUrl;
  final String currency;
  final String description;
  final String userId;
  final List<Product> products;
  const Purchase({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.cost,
    required this.paymentUrl,
    required this.currency,
    required this.description,
    required this.userId,
    required this.products,
  });

  Purchase copyWith({
    String? id,
    String? createdAt,
    String? updatedAt,
    PurchaseStatus? status,
    double? cost,
    String? paymentUrl,
    String? currency,
    String? description,
    String? userId,
    List<Product>? products,
  }) {
    return Purchase(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      cost: cost ?? this.cost,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      products: products ?? this.products,
    );
  }

  factory Purchase.fromModel(PurchaseModel model) {
    final List<Product> products = [];
    for (ProductModel productModel in model.products) {
      products.add(Product.fromModel(productModel));
    }
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
      cost: double.tryParse(model.cost) ?? 0.0,
      paymentUrl: model.paymentUrl,
      currency: model.currency,
      description: model.description,
      userId: model.userId,
      products: products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'status': status.toString(),
      'cost': cost,
      'paymentUrl': paymentUrl,
      'currency': currency,
      'description': description,
      'userId': userId,
      'products': products.map((x) => x.toJson()).toList(),
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      status: PurchaseStatus.fromString(map['status']),
      cost: map['cost'] as double,
      paymentUrl: map['paymentUrl'] as String,
      currency: map['currency'] as String,
      description: map['description'] as String,
      userId: map['userId'] as String,
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Purchase.fromJson(String source) =>
      Purchase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        status,
        cost,
        paymentUrl,
        currency,
        description,
        userId,
        products
      ];
}

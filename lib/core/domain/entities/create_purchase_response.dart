import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/create_purchase_response/create_purchase_response_model.dart';
import '../../data/models/product/product_model.dart';
import 'payment.dart';
import 'product.dart';
import 'purchase.dart';

class CreatePurchaseResponse extends Equatable {
  final Purchase purchase;
  final Payment payment;
  final List<Product> products;

  const CreatePurchaseResponse({
    required this.purchase,
    required this.payment,
    required this.products,
  });

  factory CreatePurchaseResponse.fromModel(CreatePurchaseResponseModel model) {
    final List<Product> products = [];
    for (ProductModel productModel in model.products) {
      products.add(Product.fromModel(productModel));
    }
    return CreatePurchaseResponse(
      purchase: Purchase.fromModel(model.purchase),
      payment: Payment.fromModel(model.payment),
      products: products,
    );
  }

  @override
  List<Object?> get props => [purchase, payment, products];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'purchase': purchase.toMap(),
      'payment': payment.toMap(),
      'products': products.map((x) => x.toJson()).toList(),
    };
  }

  factory CreatePurchaseResponse.fromMap(Map<String, dynamic> map) {
    return CreatePurchaseResponse(
      purchase: Purchase.fromMap(map['purchase'] as Map<String, dynamic>),
      payment: Payment.fromMap(map['payment'] as Map<String, dynamic>),
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatePurchaseResponse.fromJson(String source) =>
      CreatePurchaseResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

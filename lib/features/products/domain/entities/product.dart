import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/current_user.dart';
import '../../data/models/product/product_model.dart';
import 'model.dart';

class Product extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String description;
  final List<String> images;
  final int inStockCount;
  final double cost;
  final String slug;
  final String color;
  final String colorCode;
  final int storage;
  final int? discount;
  final Model? model;
  const Product({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.description,
    required this.images,
    required this.inStockCount,
    required this.cost,
    required this.slug,
    required this.color,
    required this.colorCode,
    required this.storage,
    required this.discount,
    required this.model,
  });

  Product copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    String? description,
    List<String>? images,
    int? inStockCount,
    double? cost,
    String? slug,
    String? color,
    String? colorCode,
    int? storage,
    int? discount,
    Model? model,
  }) {
    return Product(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      inStockCount: inStockCount ?? this.inStockCount,
      cost: cost ?? this.cost,
      slug: slug ?? this.slug,
      color: color ?? this.color,
      colorCode: colorCode ?? this.colorCode,
      storage: storage ?? this.storage,
      discount: discount ?? this.discount,
      model: model ?? this.model,
    );
  }

  factory Product.fromModel(ProductModel model) => Product(
        id: model.id,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        title: model.title,
        description: model.description,
        images: model.images,
        inStockCount: model.inStockCount,
        cost: model.cost,
        slug: model.slug,
        color: model.color,
        colorCode: model.colorCode,
        storage: model.storage,
        discount: model.discount,
        model: model.model != null ? Model.fromModel(model.model!) : null,
      );

  List<String> _getColors() {
    if (model != null) {
      final Set<String> colors = {};
      for (Product product in model!.products) {
        if (product.storage == storage) {
          colors.add(product.colorCode);
        }
      }
      return colors.toList();
    }
    return [];
  }

  List<int> _getStorages() {
    if (model != null) {
      final Set<int> storages = {};
      for (Product product in model!.products) {
        if (product.colorCode == colorCode) {
          storages.add(product.storage);
        }
      }
      return storages.toList();
    }
    return [];
  }

  List<Product> _getProducts() {
    if (model != null) {
      final Set<Product> products = {};
      for (Product product in model!.products) {
        products.add(product.copyWith(model: model));
      }
      return products.toList();
    }
    return [];
  }

  Product getProductByStorage(int storage) => products
      .firstWhere((product) =>
          product.storage == storage && product.colorCode == colorCode)
      .copyWith(model: model);

  Product getProductByColor(String colorCode) => products
      .firstWhere((product) =>
          product.colorCode == colorCode && product.storage == storage)
      .copyWith(model: model);

  List<String> get colors => _getColors();

  List<int> get storages => _getStorages();

  List<Product> get products => _getProducts();

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      images,
      inStockCount,
      cost,
      slug,
      color,
      colorCode,
      storage,
      discount,
      model,
    ];
  }

  bool isInCart(CurrentUser user) => user.cart.contains(this);

  bool isInWishlist(CurrentUser user) => user.wishlist.contains(this);

  bool isInPurchases(CurrentUser user) => user.purchases.contains(this);

  bool get isNew => DateTime.now().difference(createdAt).inDays < 7;

  bool get isOutOfStock => inStockCount == 0;

  bool get hasDiscount => discount != null;

  double get discountCost =>
      discount == null ? cost : cost - (cost / 100 * discount!);
}

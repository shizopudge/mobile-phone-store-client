import 'package:equatable/equatable.dart';

import '../../constants/enums.dart';
import '../../data/models/current_user/current_user_model.dart';
import '../../data/models/product/product_model.dart';
import 'product.dart';

class CurrentUser extends Equatable {
  final String id;
  final String email;
  final String username;
  final String? image;
  final UserRole role;
  final String? phone;
  final List<Product> cart;
  final List<Product> wishlist;
  final List<Product> purchases;
  const CurrentUser({
    required this.id,
    required this.email,
    required this.username,
    required this.image,
    required this.role,
    required this.phone,
    required this.cart,
    required this.wishlist,
    required this.purchases,
  });

  CurrentUser copyWith({
    String? id,
    String? email,
    String? username,
    String? image,
    UserRole? role,
    String? phone,
    List<Product>? cart,
    List<Product>? wishlist,
    List<Product>? purchases,
  }) {
    return CurrentUser(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      image: image ?? this.image,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      cart: cart ?? this.cart,
      wishlist: wishlist ?? this.wishlist,
      purchases: purchases ?? this.purchases,
    );
  }

  CurrentUser copyWithNewImage({
    required String? image,
  }) {
    return CurrentUser(
      id: id,
      email: email,
      username: username,
      image: image,
      role: role,
      phone: phone,
      cart: cart,
      wishlist: wishlist,
      purchases: purchases,
    );
  }

  factory CurrentUser.fromModel(CurrentUserModel model) {
    final Set<Product> cart = {};
    final Set<Product> wishlist = {};
    final Set<Product> purchases = {};
    for (ProductModel productModel in model.cart) {
      cart.add(Product.fromModel(productModel));
    }
    for (ProductModel productModel in model.wishlist) {
      wishlist.add(Product.fromModel(productModel));
    }
    for (ProductModel productModel in model.purchases) {
      purchases.add(Product.fromModel(productModel));
    }
    return CurrentUser(
      id: model.id,
      email: model.email,
      username: model.username,
      role: model.role,
      image: model.image,
      phone: model.phone,
      cart: cart.toList(),
      wishlist: wishlist.toList(),
      purchases: purchases.toList(),
    );
  }

  bool get isAdmin => role.isAdmin;

  @override
  List<Object?> get props =>
      [id, email, username, image, role, phone, cart, wishlist, purchases];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrentUserModel _$$_CurrentUserModelFromJson(Map<String, dynamic> json) =>
    _$_CurrentUserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      image: json['image'] as String?,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      phone: json['phone'] as String?,
      cart: (json['cart'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wishlist: (json['wishlist'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      purchases: (json['purchases'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CurrentUserModelToJson(_$_CurrentUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'image': instance.image,
      'role': _$UserRoleEnumMap[instance.role]!,
      'phone': instance.phone,
      'cart': instance.cart,
      'wishlist': instance.wishlist,
      'purchases': instance.purchases,
    };

const _$UserRoleEnumMap = {
  UserRole.CASUAL: 'CASUAL',
  UserRole.ADMIN: 'ADMIN',
};
